import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../base/base_page_sate.dart';
import 'cubit/task_cubit.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;
  const TaskDetailPage({super.key, required this.task});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends BasePageState<TaskDetailPage, TaskCubit> {
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
          Text(
            widget.task.title ?? '',
            style: AppTextTheme.lexendBold18,
          ),
          const SizedBox(height: 10),
          Text(
            widget.task.description ?? '',
            style: AppTextTheme.robotoMedium18,
          ),
          const SizedBox(height: 10),
          Text(
            widget.task.description ?? '',
            style: AppTextTheme.robotoMedium18,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryContainer(
                backgroundColor: AppColor.green200,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                borderRadius: 56,
                child: Text(
                  'OVERVIEW',
                  style:
                      AppTextTheme.robotoBold14.copyWith(color: AppColor.white),
                ),
              ),
              PrimaryContainer(
                backgroundColor: AppColor.green50,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              DateTimeUtils.formatDate(widget.task.startDate ?? ''),
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16,
            ),
          ),
          const SizedBox(height: 20),
          TaskDetailItem(
            icon: Assets.icCalendar,
            title: 'Due date',
            child: Text(
              DateTimeUtils.formatDate(widget.task.endDate ?? ''),
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16,
            ),
          ),
          const SizedBox(height: 20),
          TaskDetailItem(
            icon: Assets.icHistory2,
            title: 'Level',
            child: Text(
              widget.task.priorityStr ?? '',
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16,
            ),
          ),
          const SizedBox(height: 20),
          TaskDetailItem(
            icon: Assets.icHistory2,
            title: 'Status',
            child: Text(
              widget.task.statusStr ?? 'Not be Set',
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16,
            ),
          ),
          const SizedBox(height: 20),
          TaskDetailItem(
            icon: Assets.icPoint,
            title: 'Point',
            child: Text(
              (widget.task.point ?? 0).toString(),
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16,
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
                  (widget.task.assigner?.firstName).toString(),
                  style: AppTextTheme.robotoBold16,
                ),
                const SizedBox(
                  width: 10,
                ),
                PrimaryCircleImage(
                  radius: 18,
                  imageUrl: widget.task.assigner?.imageUrl,
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
                  (widget.task.assignee?.firstName).toString(),
                  style: AppTextTheme.robotoBold16,
                ),
                const SizedBox(
                  width: 10,
                ),
                PrimaryCircleImage(
                  radius: 18,
                  imageUrl: widget.task.assignee?.imageUrl,
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
            widget.task.description.toString(),
            textAlign: TextAlign.end,
            style:
                AppTextTheme.robotoLight16.copyWith(color: AppColor.green400),
          )
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
