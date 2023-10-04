import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  const TaskListItem({super.key, required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      backgroundColor: AppColor.neutral5,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.task.title ?? ''),
          Text(widget.task.description ?? ''),
          Text(
            DateTimeUtils.formatDate(
                '${widget.task.startDate ?? ''} ${DateTimeUtils.formatDate(widget.task.endDate ?? '')}'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Priority: ${widget.task.priorityStr}'),
        ],
      ),
    );
  }
}
