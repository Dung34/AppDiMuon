// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/widgets/list_view/primary_paged_list_view.dart';
import '../../shared/widgets/text_field/primary_search_text_field.dart';
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
  String? keyword;
  late TaskListPageArgs args;

  // @override
  // void initState() {
  //   super.initState();
  //   // cubit.getAllTask(page: 1);
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = context.arguments as TaskListPageArgs;
    pagingController.addPageRequestListener((pageKey) {
      cubit.getAllTask(
          page: pageKey, keyWord: keyword, keyResultId: args.keyResultId);
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
            height: 10,
          ),
          PrimarySearchTextField(
            label: '',
            controller: TextEditingController(),
            onChanged: (value) {
              keyword = value;
              pagingController.refresh();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocListener<TaskCubit, TaskState>(
              listener: (context, state) {
                if (state is TaskGetAllTaskSuccessState) {
                  if (state.taskList.length < 10) {
                    pagingController.appendLastPage(state.taskList);
                  } else {
                    // pagingController.appendLastPage(state.taskList);
                    pagingController.appendPage(state.taskList,
                        (pagingController.nextPageKey ?? 0) + 1);
                  }
                }
                if (state is TaskGetAllTaskFailedState) {
                  pagingController.appendLastPage([]);
                }
                if (state is TaskCreateSuccessState) {
                  pagingController.itemList?.insert(0, state.task);
                  pagingController.notifyListeners();
                }
                if (state is TaskDeleteSuccessState) {
                  hideLoading();
                  pagingController.itemList?.remove(state.task);
                  pagingController.notifyListeners();
                }
                if (state is TaskDeleteFailedState) {
                  hideLoading();
                }
              },
              child: PrimaryPagedListView<Task>(
                itemBuilder: (context, item, index) {
                  return TaskListItem(
                    task: item,
                    onDeletePressed: () {
                      cubit.deleteTask(item);
                      showLoading();
                    },
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
