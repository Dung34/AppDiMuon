import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/themes.dart';
import '../../domain/entity/okr/task/task.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/utils/view_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/container/primary_container.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/base_page_sate.dart';
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
    task = Task();
  }

  late final Task task;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointController = TextEditingController();

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
            const SizedBox(
              height: 20,
            ),
            PrimaryTextField(
              controller: descriptionController,
              label: 'description',
              minLines: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Assignee',
              style: AppTextTheme.robotoMedium16,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.showAppBottomSheet(const UserSearchDialog());
                    },
                    child: const PrimaryContainer(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Select member',
                          ),
                          Spacer(),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
                    onTap: () {
                      context.showAppBottomSheet(const UserSearchDialog());
                    },
                    child: const PrimaryContainer(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Select member',
                          ),
                          Spacer(),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Assign to me'),
                ),
              ],
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
    task.assignee = userCubit.currentUser!;
    cubit.createTask(task);
  }
}
