import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/widgets/list_view/primary_paged_list_view.dart';
import '../base/base_page_sate.dart';
import 'components/task_list_item.dart';
import 'cubit/task_cubit.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends BasePageState<TaskListPage, TaskCubit> {
  final PagingController<int, Task> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    // cubit.getAllTask(page: 1);
    pagingController.addPageRequestListener((pageKey) {
      log('listen');
      cubit.getAllTask(page: pageKey);
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoute.taskCreate,
            arguments: TaskCreatePageArgs(
              taskCubit: cubit,
            ),
          );
        },
        child: const Icon(
          Icons.add_box_rounded,
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Task Management',
            style: AppTextTheme.lexendBold24,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocListener<TaskCubit, TaskState>(
              listener: (context, state) {
                if (state is TaskGetAllTaskSuccessState) {
                  log('message: ${state.taskList}');
                  if (state.taskList.length < 10) {
                    pagingController.appendLastPage(state.taskList);
                  } else {
                    pagingController.appendPage(
                        state.taskList, pagingController.nextPageKey);
                  }
                }
              },
              child: PrimaryPagedListView<Task>(
                itemBuilder: (context, item, index) {
                  log('111');
                  return TaskListItem(
                    task: item,
                  );
                },
                pagingController: pagingController,
                onRefresh: () {
                  pagingController.refresh();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
