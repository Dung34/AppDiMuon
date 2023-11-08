import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/local/local_data_access.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/something/no_data.dart';
import '../../base/base_page_sate.dart';
import '../../okr_page/cubit/okr_cubit.dart';
import '../cubit/task_cubit.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends BasePageState<ToDoScreen, TaskCubit> {
  LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String userId = " ";
  List<Task> listTask = [];
  @override
  void didChangeDependencies() {
    userId = localDataAccess.getUserId();
    cubit.getAllTask(userId: userId);
    super.didChangeDependencies();
  }

  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "To-do",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          Text(
            "List tasks",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: context.screenHeight / 8,
            width: context.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 167, 229, 207),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You need to complete all',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please finish as soon as possible",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.amber)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                DateTimeUtils.formatDate(DateTime.now().toIso8601String(),
                    showTime: false),
              )),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight * 3 / 4,
            child: BlocConsumer<TaskCubit, TaskState>(
              listener: (context, state) {
                log(state.toString());
              },
              builder: (context, state) {
                if (state is TaskGetAllTaskSuccessState) {
                  listTask = state.taskList;
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        TodoItem(task: listTask[index]),
                    itemCount: listTask.length,
                  );
                } else {
                  return const NoData();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final Task task;
  const TodoItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
