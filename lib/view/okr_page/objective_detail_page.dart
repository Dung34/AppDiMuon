import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/key_result/key_result.dart';
import '../../domain/entity/okr/objective/objective.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/bloc/user/user_cubit.dart';
import '../select_tenant/tenant_cubit/tenant_cubit.dart';
import 'component/key_result_item.dart';
import 'component/objective_item.dart';
import 'cubit/okr_cubit.dart';
import 'key_result_add_page.dart';

class ObjectiveDetailPage extends StatefulWidget {
  const ObjectiveDetailPage({super.key});

  @override
  State<ObjectiveDetailPage> createState() => _ObjectiveDetailPageState();
}

class _ObjectiveDetailPageState extends State<ObjectiveDetailPage> {
  late OkrCubit cubit;
  late ObjectiveDetailPageArgs args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as ObjectiveDetailPageArgs;
    cubit = args.cubit;

    cubit.getObjectiveDetails(args.objectiveId);
    cubit.getAllKeyResult(args.objectiveId);
  }

  @override
  Widget build(BuildContext context) {
    List<KeyResult> keyResults = [];

    return Scaffold(
      appBar: PrimaryAppBar(
        actions: args.isAdmin
            ? [
                PrimaryIconButton(
                  context: context,
                  icon: Assets.icMenuDot,
                  onPressed: () {},
                ),
              ]
            : null,
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
            Text('${args.name}', style: AppTextTheme.lexendBold18),
            Row(
              children: [
                SvgPicture.asset(Assets.icArrowActionForward2),
                const Text(' Objective ', style: AppTextTheme.lexend),
                Text('from ',
                    style: AppTextTheme.lexendRegular14
                        .copyWith(color: AppColor.gray200)),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('${args.parentUnit}',
                        style: AppTextTheme.lexendBold14))
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColor.gray50,
      body: Stack(children: [
        Positioned(
            left: -16,
            top: context.screenHeight * 0.19,
            child: Image.asset(Assets.bgObjectiveDetail,
                height: context.screenHeight * 0.56,
                width: context.screenWidth * 0.7)),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrimaryNetworkImage(
                              height: 46, imageUrl: '', width: 46),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tạm thời API chưa sửa xong',
                                    style: AppTextTheme.lexendBold16
                                        .copyWith(color: AppColor.darkGray)),
                                SizedBox(
                                  width: context.screenWidth * 0.7,
                                  child: Text(
                                    'Project manager     ID: Tạm thời API chưa sửa xong',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.lexendLight14,
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Start Date',
                                  style: AppTextTheme.lexendLight14),
                              SizedBox(height: 4),
                              Text('End Date',
                                  style: AppTextTheme.lexendLight14),
                              SizedBox(height: 4),
                              Text('Target', style: AppTextTheme.lexendLight14)
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14),
                              const SizedBox(height: 4),
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14),
                              const SizedBox(height: 4),
                              Text('Tạm thời API chưa sửa xong',
                                  style: AppTextTheme.lexendRegular14)
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text('SCORE', style: AppTextTheme.lexendBold18),
                const SizedBox(height: 8),
                BlocProvider.value(
                  value: cubit,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<OkrCubit, OkrState>(
                          buildWhen: (previous, current) =>
                              current is OkrInitial ||
                              current is OkrGetObjectiveDetailsSuccessState,
                          builder: (context, state) {
                            if (state is OkrGetObjectiveDetailsSuccessState) {
                              final objectives =
                                  state.objective.relatedObjective;

                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 9),
                                    Score(objective: state.objective),
                                    const SizedBox(height: 12.0),
                                    Row(
                                      children: [
                                        SvgPicture.asset(Assets.icObjective),
                                        const Text('Objectives liên quan',
                                            style: AppTextTheme.robotoMedium14),
                                      ],
                                    ),
                                    objectives!.isNotEmpty
                                        ? ListView.builder(
                                            itemBuilder: (context, index) {
                                              final objective =
                                                  objectives[index];

                                              return InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    AppRoute.objectiveDetail,
                                                    arguments:
                                                        ObjectiveDetailPageArgs(
                                                            objectiveId: objective
                                                                .objectiveId!,
                                                            okrsId: args.okrsId,
                                                            cubit: cubit,
                                                            isAdmin:
                                                                args.isAdmin),
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    ObjectiveItem(
                                                      cubit: cubit,
                                                      objective: objective,
                                                      slidable: true,
                                                      isAdmin: args.isAdmin,
                                                    ),
                                                    const SizedBox(
                                                        height: 10.0),
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: objectives.length,
                                            shrinkWrap: true,
                                          )
                                        : const NoData()
                                  ]);
                            } else {
                              return const Loading();
                            }
                          }),
                      Row(
                        children: [
                          const Text('KEY RESULT',
                              style: AppTextTheme.lexendBold18),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text('More',
                                    style: AppTextTheme.robotoRegular16
                                        .copyWith(color: AppColor.green400)),
                                const Icon(Icons.arrow_right_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<OkrCubit, OkrState>(
                          buildWhen: (previous, current) =>
                              current is OkrGetAllKeyResultSuccessState ||
                              current is OkrCreateKeyResultSuccessState ||
                              current is OkrDeleteKeyResultSuccessState ||
                              current is OkrUpdateKeyResultSuccessState,
                          builder: (context, state) {
                            if (state is OkrGetAllKeyResultSuccessState) {
                              keyResults = state.keyResults ?? [];
                            } else if (state
                                is OkrCreateKeyResultSuccessState) {
                              keyResults.add(state.keyResult);
                            } else if (state
                                is OkrDeleteKeyResultSuccessState) {
                              keyResults.removeWhere(
                                  (element) => element.id == state.id);
                            } else if (state
                                is OkrUpdateKeyResultSuccessState) {
                              keyResults.removeWhere((element) =>
                                  element.id == state.keyResult.id);
                              keyResults.add(state.keyResult);
                            } else {
                              return const Loading();
                            }
                            return keyResults.isNotEmpty
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColor.white),
                                    padding: const EdgeInsets.all(10),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        final keyResult = keyResults[index];

                                        return InkWell(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, AppRoute.taskManager,
                                            //     arguments: TaskListPageArgs(
                                            //         keyResultId:
                                            //             keyResult.id!));
                                            Navigator.pushNamed(context,
                                                AppRoute.keyResultDetail,
                                                arguments:
                                                    KeyResultDetailPageArgs(
                                                        keyResult: keyResult,
                                                        isAdmin: true,
                                                        parentObjective:
                                                            args.name));
                                          },
                                          child: Column(
                                            children: [
                                              KeyResultItem(
                                                cubit: cubit,
                                                keyResult: keyResult,
                                              ),
                                              const Divider(
                                                  color: AppColor.gray200,
                                                  height: 16,
                                                  thickness: 0.5),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: keyResults.length,
                                      shrinkWrap: true,
                                    ),
                                  )
                                : const NoData();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  _onCreateKeyResultPressed(String okrsId, String objectiveId) {
    context.showAppBottomSheet(KeyResultAddPage(
      cubit: cubit,
      okrsId: okrsId,
      objectiveId: objectiveId,
    ));
  }
}

// class ObjectiveDetail extends StatefulWidget {
//   final Objective objective;

//   const ObjectiveDetail({super.key, required this.objective});

//   @override
//   State<ObjectiveDetail> createState() => _ObjectiveDetailState();
// }

// class _ObjectiveDetailState extends State<ObjectiveDetail> {
//   final TenantCubit tenantCubit = TenantCubit();
//   final UserCubit userCubit = UserCubit();

//   @override
//   void initState() {
//     super.initState();

//     userCubit.getUserById(userId: widget.objective.createdBy);
//     tenantCubit.getPositionForUser(widget.objective.createdBy);
//   }

//   @override
//   Widget build(BuildContext context) {
//     String? name;

//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: 1,
//                 color: AppColor.black.withOpacity(0.1),
//                 offset: const Offset(1, 1),
//                 spreadRadius: 1)
//           ],
//           color: AppColor.white),
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               BlocProvider(
//                   create: (context) => userCubit,
//                   child: BlocConsumer<UserCubit, UserState>(
//                       listener: (context, state) {
//                         if (state is UserGetUserSuccessState) {
//                           name = state.userEntity.fullName;
//                         }
//                       },
//                       builder: (context, state) =>
//                           state is UserGetUserSuccessState
//                               ? PrimaryNetworkImage(
//                                   height: 46,
//                                   imageUrl: "${state.userEntity.avatar}",
//                                   width: 46)
//                               : Container())),
//               BlocProvider(
//                 create: (context) => tenantCubit,
//                 child: BlocBuilder<TenantCubit, TenantState>(
//                   buildWhen: (previous, current) =>
//                       current is GetPositionForUserSuccessState,
//                   builder: (context, state) {
//                     return (state is GetPositionForUserSuccessState)
//                         ? Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                                 Text('$name',
//                                     style: AppTextTheme.lexendBold16
//                                         .copyWith(color: AppColor.darkGray)),
//                                 SizedBox(
//                                   width: context.screenWidth * 0.7,
//                                   child: Text(
//                                     '${state.claim.department}  ID: ${widget.unit.createdBy}}',
//                                     overflow: TextOverflow.ellipsis,
//                                     style: AppTextTheme.lexendLight14,
//                                   ),
//                                 )
//                               ])
//                         : Container();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               const Expanded(
//                   child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Start Date', style: AppTextTheme.lexendLight14),
//                   SizedBox(height: 4),
//                   Text('End Date', style: AppTextTheme.lexendLight14),
//                   SizedBox(height: 4),
//                   Text('Target', style: AppTextTheme.lexendLight14)
//                 ],
//               )),
//               Expanded(
//                   child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(DateTimeUtils.formatDate(widget.unit.startDate ?? ''),
//                       style: AppTextTheme.lexendRegular14),
//                   const SizedBox(height: 4),
//                   Text(DateTimeUtils.formatDate(widget.unit.endDate ?? ''),
//                       style: AppTextTheme.lexendRegular14),
//                   const SizedBox(height: 4),
//                   Text('${widget.unit.taskDone}/${widget.unit.totalTask}',
//                       style: AppTextTheme.lexendRegular14)
//                 ],
//               ))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class Score extends StatelessWidget {
  final Objective objective;

  const Score({super.key, required this.objective});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: context.screenWidth),
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
      child: Column(children: [
        CircularPercentIndicator(
          center: Text('${objective.process ?? 0}%',
              style: AppTextTheme.robotoBold18),
          lineWidth: 9,
          percent: objective.process ?? 0,
          progressColor: AppColor.green200,
          radius: 53,
        ),
        const SizedBox(height: 12),
        Text('PROCESSING',
            style:
                AppTextTheme.robotoBold16.copyWith(color: AppColor.green200)),
        const SizedBox(height: 6),
        Text(
          '${objective.description}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextTheme.robotoLight14,
        ),
        const SizedBox(height: 16),
      ]),
    );
  }
}
