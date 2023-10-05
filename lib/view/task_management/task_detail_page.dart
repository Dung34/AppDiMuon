import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/shimmer/container_shimmer.dart';
import '../../shared/widgets/shimmer/primary_shimmer.dart';
import '../base/base_page_sate.dart';
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
  void initState() {
    super.initState();
    setCubit = widget.taskCubit;
    cubit.resetState();
    cubit.getTaskDetail(widget.task.id ?? '');
  }

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              BackButton(),
              Expanded(
                  child: Text(
                'Detail Task',
                style: AppTextTheme.lexendBold18,
              )),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              if (state is TaskGetDetailSuccessState) {
                final task = state.task;
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
                    const SizedBox(height: 20),
                    TaskDetailItem(
                      icon: Assets.icHistory2,
                      title: 'Level',
                      child: Text(
                        task.priorityStr ?? '',
                        textAlign: TextAlign.end,
                        style: AppTextTheme.robotoBold16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TaskDetailItem(
                      icon: Assets.icHistory2,
                      title: 'Status',
                      child: Text(
                        task.statusStr ?? 'Not be Set',
                        textAlign: TextAlign.end,
                        style: AppTextTheme.robotoBold16,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            (task.assigner?.firstName).toString(),
                            style: AppTextTheme.robotoBold16,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PrimaryCircleImage(
                            radius: 18,
                            imageUrl: task.assigner?.imageUrl,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TaskDetailItem(
                      icon: Assets.icPersonCheck,
                      title: 'Assignee',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            (task.assignee?.firstName).toString(),
                            style: AppTextTheme.robotoBold16,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PrimaryCircleImage(
                            radius: 18,
                            imageUrl: task.assignee?.imageUrl,
                          )
                        ],
                      ),
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
                      textAlign: TextAlign.end,
                      style: AppTextTheme.robotoLight16
                          .copyWith(color: AppColor.green400),
                    )
                  ],
                );
              } else {
                return const TaskDetailShimmer();
              }
            },
          ),
        ],
      ),
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
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 10),
        Text(
          title,
          style: AppTextTheme.robotoMedium16.copyWith(color: AppColor.gray200),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: child,
        )
      ],
    );
  }
}
