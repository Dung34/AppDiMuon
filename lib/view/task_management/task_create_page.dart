import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../domain/entity/user/user.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/image/primary_circle_image.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
import 'components/task_priority_item.dart';
import 'components/task_select_dialog.dart';
import 'components/task_status_item.dart';
import 'cubit/task_cubit.dart';
import 'user_search_dialog.dart';

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({super.key});

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends BasePageState<TaskCreatePage, TaskCubit> {
  late final TaskCreatePageArgs args;

  @override
  bool get useBlocProviderValue => true;

  @override
  bool get isUseLoading => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = context.arguments as TaskCreatePageArgs;
    setCubit = args.taskCubit;

    setAppBar = PrimaryAppBar(
      title: args.taskId != null ? 'Update your task' : 'Create a new task',
      actions: [
        PrimaryButton(
          context: context,
          onPressed: _onTaskSave,
          label: 'Create',
        )
      ],
    );
    task = Task(
      keyResultId: args.keyResultId,
      priority: 3, status: 0, point: 0,
      // priorityStr:
    );
  }

  late final Task task;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  final TextEditingController parentTaskController = TextEditingController();
  final TextEditingController relatedTaskController = TextEditingController();

  final titleFormKey = GlobalKey<FormState>();

  @override
  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is TaskCreateSuccessState) {
          hideLoading();
          context.pop();
        }
        if (state is TaskCreateFailedState) {
          hideLoading();
          ViewUtils.toastWarning('Cập nhật thất bại');
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryTextField(
              controller: titleController,
              label: 'title',
              isRequired: true,
              formKey: titleFormKey,
              validator: ValidationUtils.textEmptyValidator,
            ),
            const SizedBox(height: 20),
            PrimaryTextField(
                controller: descriptionController,
                label: 'description',
                minLines: 3),
            const SizedBox(height: 20),
            const Text('Assignee', style: AppTextTheme.robotoMedium16),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      UserEntity? userPop = await context
                          .showAppBottomSheet(const UserSearchDialog());
                      if (userPop != null) {
                        task.assignee = userPop;
                        cubit.changeAssignee(userPop);
                      }
                    },
                    child: PrimaryContainer(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          BlocBuilder<TaskCubit, TaskState>(
                            buildWhen: (pre, current) =>
                                current is TaskChangeAssignee,
                            builder: (context, state) {
                              return state is TaskChangeAssignee
                                  ? Row(
                                      children: [
                                        PrimaryCircleImage(
                                          imageUrl: state.user.avatar ?? '',
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          state.user.fullName ?? '',
                                        )
                                      ],
                                    )
                                  : const Text(
                                      'Select member',
                                    );
                            },
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cubit.changeAssignee(userCubit.currentUser!);
                    task.assignee = userCubit.currentUser!;
                  },
                  child: const Text('Assign to me'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Assigner',
              style: AppTextTheme.robotoMedium16,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      UserEntity? userPop = await context
                          .showAppBottomSheet(const UserSearchDialog());
                      if (userPop != null) {
                        cubit.changeAssigner(userPop);
                        task.assigner = userPop;
                      }
                    },
                    child: PrimaryContainer(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          BlocBuilder<TaskCubit, TaskState>(
                            buildWhen: (pre, current) =>
                                current is TaskChangeAssigneer,
                            builder: (context, state) {
                              return state is TaskChangeAssigneer
                                  ? Row(
                                      children: [
                                        PrimaryCircleImage(
                                          imageUrl: state.user.avatar ?? '',
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          state.user.fullName ?? '',
                                        )
                                      ],
                                    )
                                  : const Text(
                                      'Select member',
                                    );
                            },
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cubit.changeAssigner(userCubit.currentUser!);
                    task.assigner = userCubit.currentUser!;
                  },
                  child: const Text('Assign to me'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Priority',
              style: AppTextTheme.robotoMedium16,
            ),
            TaskPriorityItem(
              task: task,
              onTaskPriorityTypeSelected: (type) {
                task.priority = type;
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'Status',
              style: AppTextTheme.robotoMedium16,
            ),
            TaskStatusItem(
              task: task,
              onTaskStatusTypeSelected: (type) {
                task.status = type;
              },
            ),
            const SizedBox(height: 20),
            // TaskDetailItem(
            //   icon: Assets.icPoint,
            //   title: 'Point',
            //   child: PrimaryTextField(
            //     controller: descriptionController,
            //     label: 'description',
            //     minLines: 3,
            //   ),
            // ),

            PrimaryTextField(
              controller: pointController,
              label: 'Point',
              prefixIcon: Assets.icPoint,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            PrimaryTextField(
              controller: parentTaskController,
              label: 'Parent task',
              prefixIcon: const Icon(Icons.account_tree_outlined),
              keyboardType: TextInputType.number,
              readOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  parentTaskController.text = '';
                  task.parrentTask = null;
                },
              ),
              onTap: () async {
                final taskSelected =
                    await context.showAppBottomSheet(const TaskSelectDialog());
                if (taskSelected != null) {
                  parentTaskController.text =
                      (taskSelected as Task).title ?? 'no name is set';
                  task.parrentTask = taskSelected;
                }
              },
            ),
            const SizedBox(height: 20),

            PrimaryTextField(
              controller: relatedTaskController,
              label: 'Related task',
              prefixIcon: const Icon(Icons.bug_report_outlined),
              keyboardType: TextInputType.number,
              readOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  relatedTaskController.text = '';
                  task.relatedTask = null;
                },
              ),
              onTap: () async {
                final taskSelected =
                    await context.showAppBottomSheet(const TaskSelectDialog());
                if (taskSelected != null) {
                  relatedTaskController.text =
                      (taskSelected as Task).title ?? 'no name is set';
                  task.relatedTask = [taskSelected];
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _onTaskSave() {
    final c1 = titleFormKey.currentState?.validate();
    if (!c1!) {
      Scrollable.ensureVisible(titleFormKey.currentContext!);
      return;
    }

    showLoading();
    task.title = titleController.text.trim();
    task.description = descriptionController.text.trim();
    task.point = int.tryParse((pointController.text));
    cubit.createTask(task);
  }
}
