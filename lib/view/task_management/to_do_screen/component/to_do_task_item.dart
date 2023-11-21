import 'package:flutter/material.dart';

import '../../../../domain/entity/okr/task/task.dart';
import '../../cubit/task_cubit.dart';
import '../../task_detail_page.dart';
import '../to_do_view_task.dart';

class TodoItem extends StatelessWidget {
  final Task task;
  final TaskCubit taskCubit;
  const TodoItem({super.key, required this.task, required this.taskCubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return ToDoTaskDetail(
              task: task,
              taskCubit: taskCubit,
            );
          },
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title ?? " ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TrueConnect - Agency"),
                // Text(task.description ?? "")
                Text("Hoàn thành sản phẩm")
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Due date'),
                //Text(DateTimeUtils.formatDate(task.endDate ?? ""))
                Text("30 Aug 2023")
              ],
            ),
            const Divider(
              thickness: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
