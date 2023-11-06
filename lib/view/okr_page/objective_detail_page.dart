import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/key_result/key_result.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
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
                Center(
                  child: Text(
                    '${args.appBarArgs?.totalMembersCount}',
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
                  onPressed: () {},
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
                      BorderSide(color: AppColor.green200))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PrimaryNetworkImage(
                      imageUrl: args.appBarArgs?.imageUrl,
                      height: context.screenWidth * 0.093,
                      width: context.screenWidth * 0.093)),
            )
          ],
        ),
        leadingWidth: context.screenWidth * 0.093 + 50,
        title: args.appBarArgs?.title,
      ),
      backgroundColor: AppColor.gray50,
      body: BlocProvider.value(
        value: cubit,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: AppColor.white),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<OkrCubit, OkrState>(
                    buildWhen: (previous, current) =>
                        current is OkrInitial ||
                        current is OkrGetObjectiveDetailsSuccessState,
                    builder: (context, state) {
                      if (state is OkrGetObjectiveDetailsSuccessState) {
                        final objectives = state.objective.relatedObjective;

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 9),
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    center: const Text('60%',
                                        style: AppTextTheme.robotoBold16),
                                    lineWidth: 7,
                                    percent: 0.6,
                                    progressColor: AppColor.green200,
                                    radius: context.screenWidth * 55 / 428,
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.objective.title ?? '',
                                          style: AppTextTheme.lexendBold16
                                              .copyWith(
                                                  color: AppColor.green400)),
                                      Text(state.objective.description ?? '',
                                          style: AppTextTheme.robotoLight12)
                                    ],
                                  )
                                ],
                              ),
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
                                        final objective = objectives[index];

                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              AppRoute.objectiveDetail,
                                              arguments:
                                                  ObjectiveDetailPageArgs(
                                                      appBarArgs:
                                                          args.appBarArgs,
                                                      objectiveId: objective
                                                          .objectiveId!,
                                                      okrsId: args.okrsId,
                                                      cubit: cubit,
                                                      isAdmin: args.isAdmin),
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
                                              const SizedBox(height: 10.0),
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
                    SvgPicture.asset(Assets.icKeyResult),
                    const Text('Key - Result',
                        style: AppTextTheme.robotoMedium14),
                    const Spacer(),
                    args.isAdmin
                        ? PrimaryIconButton(
                            iconColor: AppColor.yellow,
                            context: context,
                            icon: Icons.add,
                            onPressed: () {
                              _onCreateKeyResultPressed(
                                  args.okrsId, args.objectiveId);
                            })
                        : Container(),
                    const SizedBox(width: 10.0),
                  ],
                ),
                BlocBuilder<OkrCubit, OkrState>(
                    buildWhen: (previous, current) =>
                        current is OkrGetAllKeyResultSuccessState ||
                        current is OkrCreateKeyResultSuccessState ||
                        current is OkrDeleteKeyResultSuccessState ||
                        current is OkrUpdateKeyResultSuccessState,
                    builder: (context, state) {
                      if (state is OkrGetAllKeyResultSuccessState) {
                        keyResults = state.keyResults ?? [];
                      } else if (state is OkrCreateKeyResultSuccessState) {
                        keyResults.add(state.keyResult);
                      } else if (state is OkrDeleteKeyResultSuccessState) {
                        keyResults
                            .removeWhere((element) => element.id == state.id);
                      } else if (state is OkrUpdateKeyResultSuccessState) {
                        keyResults.removeWhere(
                            (element) => element.id == state.keyResult.id);
                        keyResults.add(state.keyResult);
                      } else {
                        return const Loading();
                      }
                      return keyResults.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                final keyResult = keyResults[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoute.taskManager,
                                        arguments: TaskListPageArgs(
                                            keyResultId: keyResult.id));
                                  },
                                  child: KeyResultItem(
                                    cubit: cubit,
                                    keyResult: keyResult,
                                  ),
                                );
                              },
                              itemCount: keyResults.length,
                              shrinkWrap: true,
                            )
                          : const NoData();
                    }),
              ],
            ),
          ),
        ),
      ),
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
