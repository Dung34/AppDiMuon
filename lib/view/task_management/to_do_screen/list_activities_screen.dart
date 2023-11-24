import 'package:flutter/material.dart';

import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import '../cubit/task_cubit.dart';

class ListActivities extends StatefulWidget {
  final Task task;
  final TaskCubit taskCubit;
  const ListActivities(
      {super.key, required this.task, required this.taskCubit});

  @override
  State<ListActivities> createState() => _ListActivitiesState();
}

class _ListActivitiesState extends State<ListActivities> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.taskCubit.getActitivy(widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 5 / 6,
      child: Container(
        height: context.screenHeight * 5 / 6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all()),
        child: Column(
          children: [
            Row(
              children: [BackButton(), Text("Detail Task")],
            ),
            Text(
              widget.task.title ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "TrueConnect - Agency",
              style: TextStyle(
                  color: Color(0xFF878888),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Hoàn thiện sản phẩm",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 42,
                  width: 142,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFFDEF2EC)),
                  child: const Center(
                    child: Text(
                      "OVERVIEW",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 142,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.green),
                  child: const Center(
                    child: Text(
                      "ACTIVITY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
