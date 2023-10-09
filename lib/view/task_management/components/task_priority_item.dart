import 'package:flutter_svg/svg.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import 'task_priority_select_dialog.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';

class TaskPriorityItem extends StatefulWidget {
  const TaskPriorityItem({
    super.key,
    required this.task,
    this.onTaskPriorityTypeSelected,
  });

  final Task task;
  final Function(int type)? onTaskPriorityTypeSelected;

  @override
  State<TaskPriorityItem> createState() => _TaskPriorityItemState();
}

class _TaskPriorityItemState extends State<TaskPriorityItem> {
  late String taskPriorityTitle = '';
  late Color taskPriorityColor;

  @override
  void initState() {
    taskPriorityTitle = widget.task.priorityStr ?? '';
    taskPriorityColor = getPriorityColorByType(widget.task.priority ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final int? taskPrioritySelected =
            await context.showAppBottomSheet(const TaskPrioritySelectDialog());

        if (taskPrioritySelected != null) {
          setState(() {
            taskPriorityTitle =
                getTaskPriorityStringByType(taskPrioritySelected);
            taskPriorityColor = getPriorityColorByType(taskPrioritySelected);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              taskPriorityTitle,
              textAlign: TextAlign.end,
              style:
                  AppTextTheme.robotoBold16.copyWith(color: taskPriorityColor),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(Assets.icDropdown),
          ],
        ),
      ),
    );
  }
}

Color getPriorityColorByType(int type) {
  switch (type) {
    case TaskPriority.low:
      return AppColor.blue200;
    case TaskPriority.medium:
      return AppColor.green200;
    case TaskPriority.high:
      return AppColor.yellow;
    default:
      return AppColor.red200;
  }
}

String getTaskPriorityStringByType(int type) {
  return type == TaskPriority.low
      ? TaskPriorityStr.low
      : type == TaskPriority.medium
          ? TaskPriorityStr.medium
          : type == TaskPriority.high
              ? TaskPriorityStr.high
              : TaskPriorityStr.immediate;
}
