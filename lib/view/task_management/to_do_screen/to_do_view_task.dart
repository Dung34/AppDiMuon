import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/model/old_login/login_response.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/utils/view_utils.dart';
import '../components/assignee_select_item.dart';
import '../components/task_priority_item.dart';
import '../components/task_status_item.dart';
import '../cubit/task_cubit.dart';
import '../task_detail_page.dart';

class ToDoTaskDetail extends StatefulWidget {
  final Task task;
  final TaskCubit taskCubit;
  const ToDoTaskDetail(
      {super.key, required this.task, required this.taskCubit});

  @override
  State<ToDoTaskDetail> createState() => _ToDoTaskDetailState();
}

class _ToDoTaskDetailState extends State<ToDoTaskDetail> {
  late Task? taskUpdate = widget.task.copyWith();
  late User? user;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.screenHeight * 5 / 6,
      child: BlocProvider.value(
        value: widget.taskCubit,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: context.screenHeight * 5 / 6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all()),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    const Text(
                      "Detail Task",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    BlocListener<TaskCubit, TaskState>(
                      listener: (context, state) {
                        if (state is TaskUpdateSuccessState) {
                          ViewUtils.toastSuccess("Update Successfully");
                        }
                      },
                      child: TextButton(
                          onPressed: () {
                            widget.taskCubit.updateTask(taskUpdate!);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.green),
                          )),
                    )
                  ],
                ),
                Text(
                  widget.task.title ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
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
                      height: 45,
                      width: 142,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.green),
                      child: const Center(
                        child: Text(
                          "OVERVIEW",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: 142,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xFFDEF2EC)),
                      child: const Center(
                        child: Text(
                          "ACTIVITIES",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icCalendar,
                          color: const Color(0xFFAFAFB0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "StartDate",
                          style: TextStyle(
                              color: Color(0xFFAFAFB0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      DateTimeUtils.formatDate(
                          widget.task.startDate ??
                              DateTime.now().toIso8601String(),
                          showTime: false),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icCalendar,
                          color: const Color(0xFFAFAFB0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "EndDate",
                          style: TextStyle(
                              color: Color(0xFFAFAFB0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      DateTimeUtils.formatDate(
                          widget.task.endDate ??
                              DateTime.now().toIso8601String(),
                          showTime: false),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                TaskDetailItem(
                  icon: Assets.icDoubleArrow,
                  title: 'Level',
                  child: TaskPriorityItem(
                    task: widget.task,
                    onTaskPriorityTypeSelected: (type) {
                      taskUpdate!.priority = type;
                    },
                  ),
                ),
                TaskDetailItem(
                  icon: Assets.icHistory2,
                  title: "Status",
                  child: TaskStatusItem(
                    task: widget.task,
                    onTaskStatusTypeSelected: (type) {
                      taskUpdate!.status = type;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icPoint,
                          color: const Color(0xFFAFAFB0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Point",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFAFAFB0)),
                        )
                      ],
                    ),
                    Text(
                      "${widget.task.point ?? "0"} Point",
                      style: const TextStyle(
                          color: Color(0xFFFFB81B),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                TaskDetailItem(
                  icon: Assets.icPerson,
                  title: 'Assigner',
                  child: AssigneeSelectItem(
                    assigner: taskUpdate?.assigner,
                    onUserSelected: (user) {
                      taskUpdate?.assigner = user;
                    },
                  ),
                ),
                TaskDetailItem(
                  icon: Assets.icPersonCheck,
                  title: 'Assignee',
                  child: AssigneeSelectItem(
                    assignee: taskUpdate?.assignee,
                    onUserSelected: (user) {
                      taskUpdate?.assignee = user;
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.icDocument),
                    const SizedBox(width: 10),
                    Text(
                      'Description',
                      style: AppTextTheme.robotoMedium16
                          .copyWith(color: AppColor.gray200),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.task.description ??
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the....",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
