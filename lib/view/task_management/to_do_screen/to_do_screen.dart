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

import '../../base/base_page_sate.dart';

import '../cubit/task_cubit.dart';
import 'component/to_do_task_item.dart';

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
                      child: SvgPicture.asset(Assets.icBoi),
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(color: Colors.amber)),
                )
              ],
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
                itemBuilder: (context, index) => TodoItem(
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
