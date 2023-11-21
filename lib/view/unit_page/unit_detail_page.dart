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
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import '../base/bloc/user/user_cubit.dart';
import '../okr_page/component/key_result_item.dart';
import '../okr_page/component/objective_item.dart';
import '../okr_page/cubit/okr_cubit.dart';
import '../okr_page/objective_add_page.dart';
import '../okr_page/okr_create_page.dart';
import 'component/subunit_item.dart';
import 'cubit/unit_cubit.dart';

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
  EdgeInsets get padding => EdgeInsets.zero;

  @override
  bool get useBlocProviderValue => false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as UnitDetailPageArgs;
    // setCubit = args.unitCubit;

    cubit.viewUnit(args.unit.id!);
  }

  final OkrCubit _okrCubit = getIt.get();

  delete() {
    cubit.deleteUnit(args.unit.id!);
  }

  @override
  Widget buildPage(BuildContext context) {
    List<Objective> objectives = [];

    return BlocBuilder<UnitCubit, UnitState>(
        buildWhen: (previous, current) =>
            current is UnitCreateUnitSuccessState ||
            current is UnitDeleteUnitSuccessState ||
            current is UnitGetUnitDetailSuccessState || //API bruhhhh :)
            current is UnitAddUsersInUnitSuccessState ||
            current is UnitResetState,
        builder: (context, state) {
          if (state is UnitGetUnitDetailSuccessState) {
            log(state.toString());
            unit = state.unit;
            unit.createdBy = args.unit.createdBy;

            if (unit.okRsId != null) {
              _okrCubit.getOKRDetail(okrId: unit.okRsId);
              _okrCubit.getAllObjectives(okrId: unit.okRsId!, unitId: unit.id!);
            }
          }
          if (state is UnitAddUsersInUnitSuccessState) {}
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
                    context: context, icon: Assets.icMenuDot, onPressed: () {}),
                const SizedBox(width: 10)
              ],
              backgroundColor: AppColor.white,
              elevation: 2,
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
                ],
              ),
              leadingWidth: context.screenWidth * 0.093,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(unit.name ?? '', style: AppTextTheme.lexendBold18),
                  args.parrentName != null
                      ? Row(
                          children: [
                            SvgPicture.asset(Assets.icArrowActionForward2),
                            const Text(' SubUnit ', style: AppTextTheme.lexend),
                            const Text('from ',
                                style: AppTextTheme.lexendRegular14),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(args.parrentName ?? '',
                                  style: AppTextTheme.lexendBold14),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
            ),
            backgroundColor: AppColor.gray50,
            body: Stack(
              children: [
                Positioned(
                    right: -8,
                    top: context.screenHeight * 0.19,
                    child: Image.asset(Assets.bgUnitDetailPage,
                        height: context.screenHeight * 0.648,
                        width: context.screenWidth * 0.682)),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocProvider(
                          create: (context) => _okrCubit,
                          child: BlocConsumer<OkrCubit, OkrState>(
                            listener: (context, state) {
                              if (state is OkrCreateOkrSuccessState) {
                                unit.okRsId = state.okr.id;
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
                                            backgroundColor: AppColor.green200,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        okr: state.okr, unit: unit);
                                  }
                                  if (state is OkrCreateOkrSuccessState) {
                                    return OKRDetail(
                                        okr: state.okr, unit: unit);
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text('SCORE',
                                style: AppTextTheme.lexendBold18),
                            const SizedBox(height: 12),
                            Score(okrsId: unit.okRsId),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('SUB UNITS',
                                    style: AppTextTheme.lexendBold18),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text('More',
                                          style: AppTextTheme.robotoRegular16
                                              .copyWith(
                                                  color: AppColor.green400)),
                                      const Icon(Icons.arrow_right_outlined),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.white),
                              padding: const EdgeInsets.all(8.0),
                              // ignore: prefer_is_empty
                              child: unit.subUnit?.length != 0
                                  ? Column(
                                      children: List.generate(
                                      unit.subUnit?.length ?? 0,
                                      (index) => SubUnitItem(
                                          unit: unit.subUnit![index],
                                          isAdmin: args.isAdmin),
                                    ))
                                  : const NoData(),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('OBJECTIVES',
                                    style: AppTextTheme.lexendBold18),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text('More',
                                          style: AppTextTheme.robotoRegular16
                                              .copyWith(
                                                  color: AppColor.green400)),
                                      const Icon(Icons.arrow_right_outlined),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.white),
                              padding: const EdgeInsets.all(8),
                              child: BlocProvider(
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
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          parentUnit: unit.name,
                                          cubit: _okrCubit,
                                          isAdmin: args.isAdmin,
                                        );
                                      }
                                      if (state
                                          is OkrCreateObjectiveSuccessState) {
                                        objectives.add(state.objective);
                                        return ListObj(
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          parentUnit: unit.name,
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
                                          objs: objectives,
                                          okrsId: unit.okRsId!,
                                          cubit: _okrCubit,
                                          isAdmin: args.isAdmin,
                                        );
                                      }
                                      return const NoData();
                                    }),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
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
      unitId: args.unit.id!,
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

class OKRDetail extends StatefulWidget {
  final OKR okr;
  final Unit unit;

  const OKRDetail({super.key, required this.okr, required this.unit});

  @override
  State<OKRDetail> createState() => _OKRDetailState();
}

class _OKRDetailState extends State<OKRDetail> {
  final UserCubit userCubit = UserCubit();

  @override
  void initState() {
    super.initState();
    userCubit.getUserById(userId: '${widget.unit.createdBy}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(1, 1),
                spreadRadius: 1)
          ],
          color: AppColor.white),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => userCubit,
            child: BlocBuilder<UserCubit, UserState>(
              buildWhen: (previous, current) =>
                  current is UserGetUserSuccessState,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    state is UserGetUserSuccessState
                        ? PrimaryNetworkImage(
                            height: 46,
                            imageUrl: state.userEntity.coverImage,
                            width: 46)
                        : const SizedBox(height: 24, width: 24),
                    state is UserGetUserSuccessState
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text('${state.userEntity.fullName}',
                                    style: AppTextTheme.lexendBold16
                                        .copyWith(color: AppColor.darkGray)),
                                SizedBox(
                                  width: context.screenWidth * 0.7,
                                  child: Text(
                                    'Project manager     ID: ${state.userEntity.id}',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.lexendLight14,
                                  ),
                                )
                              ])
                        : Container(),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start Date', style: AppTextTheme.lexendLight14),
                  SizedBox(height: 4),
                  Text('End Date', style: AppTextTheme.lexendLight14),
                  SizedBox(height: 4),
                  Text('Target', style: AppTextTheme.lexendLight14)
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateTimeUtils.formatDate(widget.unit.startDate ?? ''),
                      style: AppTextTheme.lexendRegular14),
                  const SizedBox(height: 4),
                  Text(DateTimeUtils.formatDate(widget.unit.endDate ?? ''),
                      style: AppTextTheme.lexendRegular14),
                  const SizedBox(height: 4),
                  Text('${widget.unit.taskDone}/${widget.unit.totalTask}',
                      style: AppTextTheme.lexendRegular14)
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}

class Score extends StatefulWidget {
  final String? okrsId;

  const Score({super.key, this.okrsId});
  @override
  State<Score> createState() => ScoreState();
}

class ScoreState extends State<Score> {
  final OkrCubit okrCubit = OkrCubit();

  @override
  void initState() {
    super.initState();
    if (widget.okrsId != null) {
      okrCubit.getOKRDetail(okrId: widget.okrsId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => okrCubit,
      child: BlocBuilder<OkrCubit, OkrState>(
        buildWhen: (previous, current) =>
            current is OkrGetOkrDetailSuccessState,
        builder: (context, state) {
          return state is OkrGetOkrDetailSuccessState
              ? PrimaryContainer(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: AppColor.black.withOpacity(0.1),
                        offset: const Offset(1, 1),
                        spreadRadius: 1)
                  ],
                  padding: const EdgeInsets.all(8),
                  child: Column(children: [
                    CircularPercentIndicator(
                      center: Text('${state.okr.process}%',
                          style: AppTextTheme.robotoBold18),
                      lineWidth: 9,
                      percent: state.okr.process ?? 0.0,
                      progressColor: AppColor.green200,
                      radius: 53,
                    ),
                    const SizedBox(height: 12),
                    Text('PROCESSING',
                        style: AppTextTheme.robotoBold16
                            .copyWith(color: AppColor.green200)),
                    const SizedBox(height: 6),
                    Text(
                      '${state.okr.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.robotoLight14,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            CircularPercentIndicator(
                              center: Text('${state.okr.process}%',
                                  style: AppTextTheme.robotoBold18),
                              lineWidth: 9,
                              percent: 0.65,
                              progressColor: AppColor.blue200,
                              radius: 53,
                            ),
                            const SizedBox(height: 6),
                            const Text('On Time',
                                style: AppTextTheme.robotoRegular14)
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            CircularPercentIndicator(
                              center: Text(
                                  '${state.okr.process!.ceil() * 100}%',
                                  style: AppTextTheme.robotoBold18),
                              lineWidth: 9,
                              percent: 0.65,
                              progressColor: AppColor.purple,
                              radius: 53,
                            ),
                            const SizedBox(height: 6),
                            const Text('ReOpen',
                                style: AppTextTheme.robotoRegular14)
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            CircularPercentIndicator(
                              center: Text('${state.okr.process}%',
                                  style: AppTextTheme.robotoBold18),
                              lineWidth: 9,
                              percent: 0.65,
                              progressColor: AppColor.darkRed,
                              radius: 53,
                            ),
                            const SizedBox(height: 6),
                            const Text('Close',
                                style: AppTextTheme.robotoRegular14)
                          ],
                        ))
                      ],
                    )
                  ]),
                )
              : Container();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ListObj extends StatelessWidget {
  final List<Objective> objs;
  final String okrsId;
  final String? parentUnit;
  final OkrCubit cubit;
  final bool isAdmin;
  const ListObj(
      {super.key,
      required this.objs,
      required this.okrsId,
      required this.cubit,
      required this.isAdmin,
      this.parentUnit});

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
                  objectiveId: objective.objectiveId!,
                  okrsId: okrsId,
                  parentUnit: parentUnit,
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
              const Divider(
                  color: AppColor.gray200, height: 16, thickness: 0.5),
            ],
          ),
        );
      },
    );
  }
}
