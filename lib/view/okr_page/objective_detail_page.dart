import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/key_result/key_result.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
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
        actions: [
          args.isAdmin
              ? PrimaryIconButton(
                  context: context,
                  icon: Icons.delete,
                  onPressed: () {
                    cubit.deleteObjective(args.objectiveId);
                    Navigator.pop(context);
                  })
              : Container(),
          const SizedBox(width: 10.0)
        ],
        title: args.name,
      ),
      backgroundColor: AppColor.white,
      body: BlocProvider.value(
        value: cubit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Objectives liên quan',
                style: AppTextTheme.lexendBold24),
            BlocBuilder<OkrCubit, OkrState>(
                buildWhen: (previous, current) =>
                    current is OkrInitial ||
                    current is OkrGetObjectiveDetailsSuccessState,
                builder: (context, state) {
                  if (state is OkrGetObjectiveDetailsSuccessState) {
                    final objectives = state.objective.relatedObjective;

                    return objectives!.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              final objective = objectives[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoute.objectiveDetail,
                                    arguments: ObjectiveDetailPageArgs(
                                        objectiveId: objective.objectiveId!,
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
                        : const NoData();
                  } else {
                    return const Loading();
                  }
                }),
            Row(
              children: [
                const Text('Key - Result', style: AppTextTheme.lexendBold24),
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
                    keyResults.removeWhere((element) => element.id == state.id);
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
                              onTap: () {},
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
