import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_icon_button.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/something/loading.dart';
import '../../shared/widgets/something/no_data.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import 'cubit/okr_cubit.dart';

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

    cubit.getObjectiveDetails(args.objectiveId, args.unitId);
    cubit.getAllKeyResult(args.objectiveId);
  }

  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<OkrCubit, OkrState>(
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

<<<<<<< HEAD
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
=======
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoute.objectiveDetail,
                                arguments: ObjectiveDetailPageArgs(
                                    objectiveId: objective.objectiveId!,
                                    unitId: args.unitId,
                                    cubit: cubit),
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
>>>>>>> 1053d2a33c9b842fe0928cbff8059a80a700b8d2
                              ),
                            ),
                          );
                        },
                        itemCount: objectives.length,
                      )
                    : const NoData();
              } else {
                return const Loading();
              }
            }),
      ),
    );
  }
}
