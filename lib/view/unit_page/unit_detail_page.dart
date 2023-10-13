import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../okr_page/cubit/okr_cubit.dart';
import '../okr_page/objective_add_page.dart';
import '../okr_page/okr_create_page.dart';
import 'cubit/unit_cubit.dart';
import 'unit_add_member.dart';

class UnitDetailPage extends StatefulWidget {
  const UnitDetailPage({super.key});

  @override
  State<UnitDetailPage> createState() => _UnitDetailPage();
}

class _UnitDetailPage extends BasePageState<UnitDetailPage, UnitCubit> {
  late final UnitDetailPageArgs args;
  late Unit unit;

  @override
  bool get isUseLoading => true;

  @override
  bool get useBlocProviderValue => false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as UnitDetailPageArgs;
    // setCubit = args.unitCubit;

    cubit.viewUnit(args.id);
  }

  final OkrCubit _okrCubit = getIt.get();

  delete() {
    cubit.deleteUnit(args.id);
  }

  @override
  Widget buildPage(BuildContext context) {
    List<Objective> objectives = [];

    return BlocBuilder<UnitCubit, UnitState>(
        buildWhen: (previous, current) =>
            current is UnitCreateUnitSuccessState ||
            current is UnitDeleteUnitSuccessState ||
            current is UnitGetUnitDetailSuccessState ||
            current is UnitAddUsersInUnitSuccessState ||
            current is UnitResetState,
        builder: (context, state) {
          if (state is UnitGetUnitDetailSuccessState) {
            unit = state.unit;
            if (unit.okRsId != null) {
              _okrCubit.getOKRDetail(okrId: unit.okRsId!, unitId: unit.id!);
              _okrCubit.getAllObjectives(okrId: unit.okRsId!, unitId: unit.id!);
            }
          }
          if (state is UnitCreateUnitSuccessState) {
            unit.subUnit = List.from(unit.subUnit ?? [])..add(state.unit);
          }
          if (state is UnitGetAllUserInUnitSuccessState) {
            unit.totalMemberCount = unit.totalMemberCount! + state.users.length;
          }
          if (state is UnitResetState) {
            return const Loading();
          }
          return Scaffold(
            appBar: PrimaryAppBar(
              actions: [
                PrimaryIconButton(
                    context: context,
                    icon: Icons.delete,
                    onPressed: () {
                      delete();
                      context.pop();
                    }),
                const SizedBox(
                  width: 10,
                ),
                PrimaryIconButton(
                    context: context,
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.unitAdd,
                          arguments:
                              UnitAddPageArgs(cubit: cubit, id: unit.id));
                    }),
                const SizedBox(
                  width: 10,
                ),
                PrimaryIconButton(
                  context: context,
                  icon: Icons.person_add_alt_1,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return UnitAddMember(
                            unit: unit,
                            cubit: cubit,
                          );
                        });
                  },
                ),
              ],
              leading: PrimaryIconButton(
                context: context,
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: unit.name ?? '',
            ),
            backgroundColor: AppColor.gray50,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          child: PrimaryNetworkImage(
                        imageUrl: unit.coverImage ?? '',
                        height: 100,
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${unit.name}',
                            style: AppTextTheme.lexendBold18,
                          ),
                          Text('Member quantity: ${unit.totalMemberCount}'),
                        ],
                      )),
                    ],
                  ),
                  Text(
                    '${unit.description}',
                    style: AppTextTheme.lexendRegular14,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Sub units',
                    style: AppTextTheme.lexendBold24,
                  ),
                  if (unit.subUnit != null)
                    Wrap(
                      spacing: 20,
                      children: unit.subUnit!
                          .map((e) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoute.unitDetail,
                                        arguments: UnitDetailPageArgs(
                                          id: e.id!,
                                          unitCubit: cubit,
                                        ),
                                      );
                                    },
                                    child: PrimaryContainer(
                                      child: PrimaryNetworkImage(
                                        imageUrl: e.coverImage ?? '',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      e.name ?? '',
                                      textAlign: TextAlign.center,
                                      style: AppTextTheme.robotoBold14.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  Row(
                    children: [
                      const Text('OKR', style: AppTextTheme.lexendBold24),
                      const Spacer(),
                      PrimaryIconButton(
                          iconColor: AppColor.green200,
                          context: context,
                          icon: Icons.add_outlined,
                          onPressed: () {
                            _onCreateObjectivePressed(
                                unit.okRsId!, args.id, objectives);
                          }),
                      const SizedBox(width: 10.0),
                      PrimaryIconButton(
                          iconColor: AppColor.yellow,
                          context: context,
                          icon: Icons.add_outlined,
                          onPressed: () {}),
                      const SizedBox(width: 10.0),
                      PrimaryIconButton(
                          iconColor: AppColor.red200,
                          context: context,
                          icon: Icons.add_outlined,
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 20),
                  unit.okRsId == null
                      ? Column(
                          children: [
                            const Text('You haven\'t create any OKR yet'),
                            const SizedBox(height: 10),
                            PrimaryButton(
                                context: context,
                                onPressed: _onCreateOKRPressed,
                                label: 'Create OKR'),
                          ],
                        )
                      : Column(
                          children: [
                            BlocProvider(
                              create: (context) => _okrCubit,
                              child: BlocBuilder<OkrCubit, OkrState>(
                                buildWhen: (previous, current) =>
                                    current is OkrGetOkrDetailSuccessState ||
                                    current is OkrCreateOkrSuccessState,
                                builder: (context, state) {
                                  if (state is OkrGetOkrDetailSuccessState) {
                                    return OKRDetail(
                                        okr: state.okr, unitId: args.id);
                                  }
                                  if (state is OkrCreateOkrSuccessState) {
                                    return OKRDetail(
                                        okr: state.okr, unitId: args.id);
                                  }
                                  return const Loading();
                                },
                              ),
                            ),
                            BlocProvider(
                              create: (context) => _okrCubit,
                              child: BlocBuilder<OkrCubit, OkrState>(
                                  buildWhen: (previous, current) => current
                                      is OkrGetAllObjectivesSuccessState,
                                  builder: (context, state) {
                                    if (state
                                        is OkrGetAllObjectivesSuccessState) {
                                      objectives = state.objectives!;
                                      return ListObj(
                                          objs: objectives, unitId: args.id);
                                    } else {
                                      return Container();
                                    }
                                  }),
                            )
                          ],
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  _onCreateOKRPressed() {
    context
        .showAppBottomSheet(OKRCreatePage(unitId: args.id, cubit: _okrCubit));
  }

  _onCreateObjectivePressed(
      String okrsId, String unitId, List<Objective> objectives) {
    context.showAppBottomSheet(ObjectiveAddPage(
      okrsId: okrsId,
      unitId: unitId,
      cubit: _okrCubit,
      objectives: objectives,
    ));
  }
}

class OKRDetail extends StatelessWidget {
  final OKR okr;
  final String unitId;

  const OKRDetail({super.key, required this.okr, required this.unitId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          okr.name.toString(),
          style: AppTextTheme.lexendBold18,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    okr.totalObjective.toString(),
                    style: AppTextTheme.lexendBold30
                        .copyWith(color: AppColor.green200),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Objectives',
                    style: AppTextTheme.lexendBold16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    okr.totalKR.toString(),
                    style: AppTextTheme.lexendBold30
                        .copyWith(color: AppColor.yellow),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Key-Results',
                    style: AppTextTheme.lexendBold16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    okr.totalTask.toString(),
                    style: AppTextTheme.lexendBold30
                        .copyWith(color: AppColor.red200),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tasks',
                    style: AppTextTheme.lexendBold16,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// ignore: must_be_immutable
class ListObj extends StatelessWidget {
  final List<Objective> objs;
  final String unitId;

  const ListObj({
    super.key,
    required this.objs,
    required this.unitId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: objs.length,
      itemBuilder: (context, index) {
        final objective = objs[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoute.objectiveDetail,
              arguments: ObjectiveDetailPageArgs(
                name: objective.title,
                objectiveId: objective.id!,
                unitId: unitId,
              ),
            );
          },
          child: PrimaryContainer(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  objective.title.toString(),
                  style: AppTextTheme.lexendBold16,
                ),
                const SizedBox(height: 10),
                Text(
                    'Due date: ${DateTimeUtils.formatDate(DateTime.now().toString())}')
              ],
            ),
          ),
        );
      },
    );
  }
}
