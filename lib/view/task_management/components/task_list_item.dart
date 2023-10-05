import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../cubit/task_cubit.dart';
import '../task_detail_page.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  const TaskListItem({super.key, required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.showAppBottomSheet(
          TaskDetailPage(
            task: widget.task,
            taskCubit: context.read<TaskCubit>(),
          ),
          isScrollControlled: true,
        );
      },
      child: PrimaryContainer(
        backgroundColor: AppColor.green100,
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title ?? '',
              style: AppTextTheme.lexendBold16,
            ),
            Text(
              widget.task.description ?? '',
              style: AppTextTheme.lexendRegular14,
            ),
            Text(
                '${DateTimeUtils.formatDate(widget.task.startDate ?? '')} - ${DateTimeUtils.formatDate(widget.task.endDate ?? '')}'),
            const SizedBox(
              height: 10,
            ),
            Text('Priority: ${widget.task.priorityStr}'),
          ],
        ),
      ),
    );
  }
}
