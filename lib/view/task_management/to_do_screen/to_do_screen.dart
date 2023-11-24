import 'package:active_plus/view/task_management/task_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes.dart';
import '../../../data/repository/local/local_data_access.dart';
import '../../../data/resources/resources.dart';
import '../../../di/di.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';

import '../../../shared/widgets/image/primary_image.dart';
import '../../base/base_page_sate.dart';

import '../cubit/task_cubit.dart';
import 'component/to_do_task_item.dart';
import 'to_do_view_task.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends BasePageState<ToDoScreen, TaskCubit> {
  LocalDataAccess localDataAccess = getIt.get<LocalDataAccess>();
  String userId = " ";
  late ToDoArgs args;
  List<Task> listTask = [];
  @override
  void didChangeDependencies() {
    userId = localDataAccess.getUserId();
    args = context.arguments as ToDoArgs;
    super.didChangeDependencies();
  }

  @override
  Widget buildPage(BuildContext context) {
    listTask = args.listTask;
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
            (!args.isLate) ? "List tasks" : "Lost Tasks",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 117,
            width: context.screenWidth - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset((!args.isLate) ? Assets.imBoi : Assets.imGirl),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                DateTimeUtils.formatDate(DateTime.now().toIso8601String(),
                    showTime: false),
              )),
          SizedBox(
              width: context.screenWidth,
              height: context.screenHeight * 3 / 4,
              child: ListView.builder(
                itemBuilder: (context, index) => (!args.isLate)
                    ? TodoItem(
                        task: listTask[index],
                        taskCubit: cubit,
                      )
                    : LostTaskItem(
                        task: listTask[index],
                        taskCubit: cubit,
                      ),
                itemCount: listTask.length,
              ))
        ],
      ),
    );
  }
}

class LostTaskItem extends StatelessWidget {
  final Task task;
  final TaskCubit taskCubit;
  const LostTaskItem({super.key, required this.task, required this.taskCubit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => BottomSheetTask(
            task: task,
            taskCubit: taskCubit,
            isAdmin: true,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            task.title ?? "Affiliate cho các tất cả Agency",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TrueConnect - Agency',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF878888),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                task.description ?? "Hoàn thành sản phẩm",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Assignee :",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF878888)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: PrimaryNetworkImage(
                  imageUrl: task.assignee!.avatar ?? "",
                  height: 25,
                  width: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                task.assignee!.fullName ?? "Nguyen Thu Ha",
                style: const TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Divider()
        ]),
      ),
    );
  }
}
