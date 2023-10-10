import 'package:flutter_svg/svg.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import 'task_status_select_dialog.dart';

class TaskStatusItem extends StatefulWidget {
  const TaskStatusItem({
    super.key,
    required this.task,
    this.onTaskStatusTypeSelected,
  });

  final Task task;
  final Function(int type)? onTaskStatusTypeSelected;

  @override
  State<TaskStatusItem> createState() => _TaskStatusItemState();
}

class _TaskStatusItemState extends State<TaskStatusItem> {
  late String taskStatusTitle = '';
  late Color taskStatusColor;

  @override
  void initState() {
    taskStatusTitle = getTaskStatusStringByType(widget.task.status ?? 0);
    taskStatusColor = getStatusColorByType(widget.task.status ?? 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final int? taskStatusSelected =
            await context.showAppBottomSheet(const TaskStatusSelectDialog());

        if (taskStatusSelected != null) {
          setState(() {
            taskStatusTitle = getTaskStatusStringByType(taskStatusSelected);
            taskStatusColor = getStatusColorByType(taskStatusSelected);
          });
          widget.onTaskStatusTypeSelected?.call(taskStatusSelected);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              taskStatusTitle,
              textAlign: TextAlign.end,
              style: AppTextTheme.robotoBold16.copyWith(color: taskStatusColor),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(Assets.icDropdown),
          ],
        ),
      ),
    );
  }
}

Color getStatusColorByType(int type) {
  switch (type) {
    case TaskStatus.notStarted:
      return AppColor.blue200;
    case TaskStatus.beginning:
      return AppColor.green200;
    case TaskStatus.ended:
      return AppColor.yellow;
    default:
      return AppColor.red200;
  }
}

String getTaskStatusStringByType(int type) {
  return type == TaskStatus.notStarted
      ? TaskStatusStr.notStarted
      : type == TaskStatus.beginning
          ? TaskStatusStr.beginning
          : type == TaskStatus.ended
              ? TaskStatusStr.ended
              : TaskStatusStr.late;
}
