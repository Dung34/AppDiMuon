import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../di/di.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../domain/entity/okr/okr_wrapper/okr.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../okr_page/component/objective_item.dart';
import '../okr_page/cubit/okr_cubit.dart';
import '../okr_page/objective_add_page.dart';
import '../okr_page/okr_create_page.dart';
import 'cubit/unit_cubit.dart';
import 'unit_detail_member.dart';

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
  EdgeInsets get padding => const EdgeInsets.only(right: 10);

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
    int totalMembersCount = 0;

    return BlocBuilder<UnitCubit, UnitState>(
        buildWhen: (previous, current) =>
            current is UnitCreateUnitSuccessState ||
            current is UnitDeleteUnitSuccessState ||
            current is UnitGetUnitDetailSuccessState ||
            current is UnitAddUsersInUnitSuccessState ||
            current is UnitResetState,
        builder: (context, state) {
          if (state is UnitGetUnitDetailSuccessState) {
            log(state.toString());
            unit = state.unit;
            totalMembersCount = unit.totalMemberCount ?? 0;

            if (unit.okRsId != null) {
              _okrCubit.getOKRDetail(okrId: unit.okRsId!, unitId: unit.id!);
              _okrCubit.getAllObjectives(okrId: unit.okRsId!, unitId: unit.id!);
            }
          }
          if (state is UnitAddUsersInUnitSuccessState) {
            totalMembersCount += state.members.length;
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
              actions: args.isAdmin
                  ? [
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
                      Center(
                        child: Text(
                          '$totalMembersCount',
                          style: AppTextTheme.robotoMedium14
                              .copyWith(color: AppColor.green200),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 5),
                      PrimaryIconButton(
                        context: context,
                        icon: Assets.icPeople,
                        iconColor: AppColor.green200,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return UnitDetailMember(
                                  unit: unit,
                                  cubit: cubit,
                                );
                              });
                        },
                      ),
                    ]
                  : null,
              backgroundColor: AppColor.white,
              leading: Row(
                children: [
                  const SizedBox(width: 10),
                  PrimaryIconButton(
                    context: context,
                    icon: Icons.arrow_back_ios_rounded,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColor.green200)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: PrimaryNetworkImage(
                            imageUrl: unit.coverImage,
                            height: context.screenWidth * 0.093,
                            width: context.screenWidth * 0.093)),
                  )
                ],
              ),
              leadingWidth: context.screenWidth * 0.093 + 50,
              title: unit.name ?? '',
            ),
            backgroundColor: AppColor.gray50,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: double.infinity),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: AppColor.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PrimaryIconButton(
                                context: context,
                                onPressed: () {},
                                icon: Icons.next_plan),
                            const SizedBox(height: 8),
                            const Text('Main',
                                style: AppTextTheme.robotoMedium12),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: PrimaryNetworkImage(
                                      imageUrl: unit.coverImage,
                                      height: context.screenWidth * 0.093,
                                      width: context.screenWidth * 0.093)),
                            ),
                            Text('${unit.name}',
                                style: AppTextTheme.robotoLight12),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF5EB1FF)),
                              height: 8,
                              padding: const EdgeInsets.all(8),
                              width: context.screenWidth / 6 - 16,
                            ),
                            const SizedBox(height: 16),
                            const Text('Sub',
                                style: AppTextTheme.robotoMedium12),
                            const SizedBox(height: 8),
                            if (unit.subUnit != null)
                              Wrap(
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
                                                    isAdmin: args.isAdmin,
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: PrimaryNetworkImage(
                                                  imageUrl: e.coverImage ?? '',
                                                  height: context.screenWidth *
                                                      0.093,
                                                  width: context.screenWidth *
                                                      0.093,
                                                ),
                                              ),
                                            ),
                                            Text(e.name ?? '',
                                                textAlign: TextAlign.center,
                                                style: AppTextTheme
                                                    .robotoLight12
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                            const SizedBox(height: 8),
                                          ],
                                        ))
                                    .toList(),
                              ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 55,
                  child: SingleChildScrollView(
                    child: Container(
                      constraints:
                          BoxConstraints(minHeight: context.screenHeight),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFFAFFFA)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: args.isAdmin
                                ? [
                                    const Text('OKR',
                                        style: AppTextTheme.lexendBold24),
                                    const Spacer(),
                                    PrimaryIconButton(
                                        iconColor: AppColor.green200,
                                        context: context,
                                        icon: Icons.add_outlined,
                                        onPressed: () {
                                          log(state.toString());
                                          _onCreateObjectivePressed(
                                              unit.okRsId!,
                                              args.id,
                                              objectives);
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
                                  ]
                                : [],
                          ),
                          const SizedBox(height: 20),
                          BlocProvider(
                            create: (context) => _okrCubit,
                            child: BlocConsumer<OkrCubit, OkrState>(
                              listener: (context, state) {
                                if (state is OkrCreateOkrSuccessState) {
                                  unit.okRsId = state.okr.id;
                                }
                                if (state is UnitGetUnitDetailSuccessState) {
                                  _okrCubit.getOKRDetail(
                                      okrId: unit.okRsId!, unitId: unit.id!);
                                }
                              },
                              builder: (context, state) {
                                return (unit.okRsId == null)
                                    ? Column(
                                        children: [
                                          const Text(
                                              'You haven\'t create any OKR yet'),
                                          const SizedBox(height: 10),
                                          PrimaryButton(
                                              backgroundColor:
                                                  AppColor.green200,
                                              context: context,
                                              onPressed: _onCreateOKRPressed,
                                              label: 'Create OKR'),
                                        ],
                                      )
                                    : Container();
                              },
                            ),
                          ),
                          Column(
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
                                    return Container();
                                  },
                                ),
                              ),
                              BlocProvider(
                                create: (context) => _okrCubit,
                                child: BlocBuilder<OkrCubit, OkrState>(
                                    buildWhen: (previous, current) =>
                                        current is OkrGetAllObjectivesSuccessState ||
                                        current
                                            is OkrCreateObjectiveSuccessState ||
                                        current
                                            is OkrDeleteObjectiveSuccessState,
                                    builder: (context, state) {
                                      if (state
                                          is OkrGetAllObjectivesSuccessState) {
                                        objectives = state.objectives!;
                                        return ListObj(
                                          appBarArgs: AppBarArgs(
                                              imageUrl: unit.coverImage,
                                              title: unit.name,
                                              totalMembersCount:
                                                  totalMembersCount),
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          cubit: _okrCubit,
                                          isAdmin: args.isAdmin,
                                        );
                                      }
                                      if (state
                                          is OkrCreateObjectiveSuccessState) {
                                        objectives.add(state.objective);
                                        return ListObj(
                                          appBarArgs: AppBarArgs(
                                              imageUrl: unit.coverImage,
                                              title: unit.name,
                                              totalMembersCount:
                                                  totalMembersCount),
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          cubit: _okrCubit,
                                          isAdmin: args.isAdmin,
                                        );
                                      }
                                      if (state
                                          is OkrDeleteObjectiveSuccessState) {
                                        _okrCubit.getAllObjectives(
                                            unitId: unit.id,
                                            okrId: unit.okRsId);
                                      }
                                      if (state
                                          is OkrUpdateObjectiveSuccessState) {
                                        objectives.removeWhere((element) =>
                                            element.objectiveId ==
                                            state.objective.objectiveId);
                                        objectives.add(state.objective);
                                        return ListObj(
                                          appBarArgs: AppBarArgs(
                                              imageUrl: unit.coverImage,
                                              title: unit.name,
                                              totalMembersCount:
                                                  totalMembersCount),
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          cubit: _okrCubit,
                                          isAdmin: args.isAdmin,
                                        );
                                      }
                                      return const CircularProgressIndicator();
                                    }),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  _onCreateOKRPressed() {
    context.showAppBottomSheet(OKRCreatePage(
      unitId: args.id,
      cubit: _okrCubit,
      unitCubit: cubit,
    ));
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
        Text(okr.name.toString(), style: AppTextTheme.lexendBold18),
        const SizedBox(height: 20),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColor.neutral5, width: 1))),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColor.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icObjective,
                              height: 24, width: 24),
                          Text(okr.totalObjective.toString(),
                              style: AppTextTheme.lexendBold24),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Objectives',
                        style: AppTextTheme.lexendBold16,
                      ),
                      const SizedBox(height: 12)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColor.white,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icKeyResult),
                            Text(okr.totalKR.toString(),
                                style: AppTextTheme.lexendBold24
                                    .copyWith(color: AppColor.purple))
                          ]),
                      const SizedBox(height: 10),
                      Text('Key-Results',
                          style: AppTextTheme.lexendBold16
                              .copyWith(color: AppColor.purple)),
                      const SizedBox(height: 12)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColor.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icKeyResult),
                          Text(okr.totalTask.toString(),
                              style: AppTextTheme.lexendBold24
                                  .copyWith(color: AppColor.red100)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('Tasks',
                          style: AppTextTheme.lexendBold16
                              .copyWith(color: AppColor.red100)),
                      const SizedBox(height: 12)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// ignore: must_be_immutable
class ListObj extends StatelessWidget {
  final List<Objective> objs;
  final String okrsId;
  final OkrCubit cubit;
  final bool isAdmin;
  final AppBarArgs? appBarArgs;

  const ListObj(
      {super.key,
      required this.objs,
      required this.okrsId,
      required this.cubit,
      required this.isAdmin,
      this.appBarArgs});

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
                  appBarArgs: appBarArgs,
                  name: objective.title,
                  objectiveId: objective.objectiveId!,
                  okrsId: okrsId,
                  cubit: cubit,
                  isAdmin: isAdmin),
            );
          },
          child: Column(
            children: [
              ObjectiveItem(
                cubit: cubit,
                objective: objective,
                slidable: true,
                isAdmin: isAdmin,
              ),
              const SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
}
