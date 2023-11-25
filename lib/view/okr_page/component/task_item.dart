import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/task/task.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../cubit/okr_cubit.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  final OkrCubit cubit;
  final Task task;

  const TaskItem({super.key, required this.task, required this.cubit});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    // double doneTask = 0.0 + (widget.task.doneTask ?? 0);
    // double totalTask = widget.task.totalTask == null
    //     ? 1.0
    //     : widget.task.totalTask == 0
    //         ? 1.0
    //         : (widget.task.totalTask! + 0.0);

    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              backgroundColor: AppColor.blue200,
              borderRadius: BorderRadius.circular(10.0),
              flex: 1,
              foregroundColor: AppColor.white,
              icon: Icons.delete,
              label: 'Sửa',
              onPressed: (context) {
                _onUpdatetaskPressed();
              },
            ),
            const SizedBox(width: 5.0),
            SlidableAction(
              autoClose: true,
              backgroundColor: AppColor.red200,
              borderRadius: BorderRadius.circular(10.0),
              flex: 1,
              foregroundColor: AppColor.white,
              icon: Icons.delete,
              label: 'Xóa',
              onPressed: (context) {
                // widget.cubit.deletetask(widget.task.id!);
              },
            )
          ],
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                statusText[widget.task.status ?? 0],
                Text('${widget.task.title}',
                    style: AppTextTheme.lexendBold16
                        .copyWith(color: AppColor.green400)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Assignee', style: AppTextTheme.lexendLight14),
                        SizedBox(height: 8),
                        Text('Due Date', style: AppTextTheme.lexendLight14)
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${widget.task.assignee?.fullName}',
                            style: AppTextTheme.lexendRegular14
                                .copyWith(color: AppColor.darkGray)),
                        const SizedBox(height: 8),
                        Text(
                            DateTimeUtils.formatDate('${widget.task.endDate}',
                                showTime: false),
                            style: AppTextTheme.lexendRegular14
                                .copyWith(color: AppColor.darkGray))
                      ],
                    )),
                    const SizedBox(width: 6),
                  ],
                ),
                const SizedBox(height: 6)
              ],
            ),
          ),
        ]));
  }

  _onUpdatetaskPressed() {
    // context.showAppBottomSheet(
    //     taskUpdatePage(task: widget.task, cubit: widget.cubit));
  }
}

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Widget? center;
  final Color progressColor;

  const CircularPercentIndicator({
    super.key,
    this.radius = 100.0,
    this.lineWidth = 5.0,
    this.percent = 0.0,
    this.center,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: percent,
              strokeWidth: lineWidth,
              valueColor: AlwaysStoppedAnimation(progressColor),
              backgroundColor: Colors.grey[200],
            ),
          ),
          if (center != null)
            Positioned.fill(
              child: Center(child: center),
            ),
        ],
      ),
    );
  }
}
