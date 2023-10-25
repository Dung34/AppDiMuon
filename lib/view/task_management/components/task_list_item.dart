import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../cubit/task_cubit.dart';
import '../task_detail_page.dart';
import 'task_priority_item.dart';
import 'task_status_item.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  final Function()? onDeletePressed;
  const TaskListItem({super.key, required this.task, this.onDeletePressed});

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
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        margin: const EdgeInsets.only(top: 10),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 2,
                autoClose: true,
                onPressed: (context) {
                  widget.onDeletePressed?.call();
                },
                backgroundColor: AppColor.red200,
                borderRadius: BorderRadius.circular(10),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.task.title ?? '',
                      style: AppTextTheme.lexendBold16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      const Text('Priority: '),
                      TaskPriorityItem(task: widget.task),
                    ],
                  ),
                ],
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
              Row(
                children: [
                  const Text('Status: '),
                  TaskStatusItem(task: widget.task),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
