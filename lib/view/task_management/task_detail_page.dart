import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/shimmer/container_shimmer.dart';
import '../../shared/widgets/shimmer/primary_shimmer.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../base/base_page_sate.dart';
import 'components/assignee_select_item.dart';
import 'components/task_priority_item.dart';
import 'components/task_status_item.dart';
import 'cubit/task_cubit.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;
  final TaskCubit taskCubit;
  const TaskDetailPage(
      {super.key, required this.task, required this.taskCubit});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends BasePageState<TaskDetailPage, TaskCubit> {
  @override
  bool get useBlocProviderValue => true;

  @override
  bool get isUseLoading => true;

  late Task? taskUpdate;

  @override
  void initState() {
    super.initState();
    setCubit = widget.taskCubit;
    cubit.resetState();
    cubit.getTaskDetail(widget.task.id ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setAppBar = PrimaryAppBar(
      title: 'Task Detail',
      actions: [
        TextButton(
          onPressed: _onUpdateTaskPressed,
          child: const Text('Update'),
        ),
      ],
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is TaskUpdateSuccessState) {
            hideLoading();
            ViewUtils.toastSuccess('Update Successfully');
          } else if (state is TaskUpdateFailedState) {
            hideLoading();
            ViewUtils.toastWarning('Update Failed');
          }
        },
        builder: (context, state) {
          if (state is TaskGetDetailSuccessState ||
              state is TaskUpdateSuccessState) {
            late final Task task;
            if (state is TaskGetDetailSuccessState) {
              task = state.task;
            } else if (state is TaskUpdateSuccessState) {
              task = state.task;
            }
            taskUpdate = task;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title ?? '',
                  style: AppTextTheme.lexendBold18,
                ),
                const SizedBox(height: 10),
                Text(
                  task.description ?? '',
                  style: AppTextTheme.robotoMedium18,
                ),
                const SizedBox(height: 10),
                Text(
                  task.description ?? '',
                  style: AppTextTheme.robotoMedium18,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryContainer(
                      backgroundColor: AppColor.green200,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      borderRadius: 56,
                      child: Text(
                        'OVERVIEW',
                        style: AppTextTheme.robotoBold14
                            .copyWith(color: AppColor.white),
                      ),
                    ),
                    PrimaryContainer(
                      backgroundColor: AppColor.green50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      borderRadius: 56,
                      child: Text(
                        'ACTIVITIES',
                        style: AppTextTheme.robotoBold14
                            .copyWith(color: AppColor.green200),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TaskDetailItem(
                  icon: Assets.icCalendar,
                  title: 'Start date',
                  child: Text(
                    DateTimeUtils.formatDate(task.startDate ?? ''),
                    textAlign: TextAlign.end,
                    style: AppTextTheme.robotoBold16,
                  ),
                ),
                const SizedBox(height: 20),
                TaskDetailItem(
                  icon: Assets.icCalendar,
                  title: 'Due date',
                  child: Text(
                    DateTimeUtils.formatDate(task.endDate ?? ''),
                    textAlign: TextAlign.end,
                    style: AppTextTheme.robotoBold16,
                  ),
                ),
                const SizedBox(height: 10),
                TaskDetailItem(
                  icon: Assets.icHistory2,
                  title: 'Prioriry',
                  child: TaskPriorityItem(
                    task: task,
                    onTaskPriorityTypeSelected: (type) {
                      taskUpdate!.priority = type;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                TaskDetailItem(
                  icon: Assets.icHistory2,
                  title: 'Status',
                  child: TaskStatusItem(
                    task: task,
                    onTaskStatusTypeSelected: (type) {
                      taskUpdate!.status = type;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TaskDetailItem(
                  icon: Assets.icPoint,
                  title: 'Point',
                  child: Text(
                    '${task.point ?? 0} point',
                    textAlign: TextAlign.end,
                    style: AppTextTheme.robotoBold16
                        .copyWith(color: AppColor.yellow),
                  ),
                ),
                const SizedBox(height: 20),
                TaskDetailItem(
                  icon: Assets.icPerson,
                  title: 'Assigner',
                  child: AssigneeSelectItem(
                    assigner: taskUpdate?.assigner,
                    onUserSelected: (user) {
                      taskUpdate?.assigner = user;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TaskDetailItem(
                  icon: Assets.icPersonCheck,
                  title: 'Assignee',
                  child: AssigneeSelectItem(
                    assignee: taskUpdate?.assignee,
                    onUserSelected: (user) {
                      taskUpdate?.assignee = user;
                    },
                  ),
                  // Row(
                  //   children: [
                  // AssigneeSelectItem(task: taskUpdate!),
                  // TextButton(
                  //   onPressed: () {
                  //     cubit.changeAssignee(userCubit.currentUser!);
                  //     task.assignee = userCubit.currentUser!;
                  //   },
                  //   child: const Text('Assign to me'),
                  // ),
                  //   ],
                  // ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.icDocument),
                    const SizedBox(width: 10),
                    Text(
                      'Description',
                      style: AppTextTheme.robotoMedium16
                          .copyWith(color: AppColor.gray200),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(
                  task.description.toString(),
                  style: AppTextTheme.robotoLight16
                      .copyWith(color: AppColor.green400),
                ),
                const SizedBox(width: 50),
              ],
            );
          } else {
            return const TaskDetailShimmer();
          }
        },
      ),
    );
  }

  void _onUpdateTaskPressed() {
    if (taskUpdate != null) {
      showLoading();
      cubit.updateTask(taskUpdate!);
    }
  }
}

class TaskDetailItem extends StatelessWidget {
  final String icon;
  final String title;
  final Widget child;
  const TaskDetailItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style:
                  AppTextTheme.robotoMedium16.copyWith(color: AppColor.gray200),
            ),
            const SizedBox(width: 10),
            // const Spacer(),
            Expanded(child: child)
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 0.5,
          color: AppColor.gray200,
        )
      ],
    );
  }
}

class TaskDetailShimmer extends StatelessWidget {
  const TaskDetailShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerShimmer(width: context.screenWidth * 0.8),
          const SizedBox(height: 10),
          ContainerShimmer(width: context.screenWidth * 0.5),
          const SizedBox(height: 10),
          ContainerShimmer(width: context.screenWidth * 0.45),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerShimmer(width: context.screenWidth * 0.3),
              ContainerShimmer(width: context.screenWidth * 0.4),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerShimmer(width: context.screenWidth * 0.3),
              ContainerShimmer(width: context.screenWidth * 0.4),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerShimmer(width: context.screenWidth * 0.2),
              ContainerShimmer(width: context.screenWidth * 0.2),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerShimmer(width: context.screenWidth * 0.3),
              ContainerShimmer(width: context.screenWidth * 0.4),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ContainerShimmer(width: context.screenWidth * 0.3),
              const Spacer(),
              ContainerShimmer(width: context.screenWidth * 0.4),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 18,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ContainerShimmer(width: context.screenWidth * 0.3),
              const Spacer(),
              ContainerShimmer(width: context.screenWidth * 0.4),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
