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
          PrimaryIconButton(
              context: context,
              icon: Icons.delete,
              onPressed: () {
                cubit.deleteObjective(args.objectiveId);
                Navigator.pop(context);
              }),
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
