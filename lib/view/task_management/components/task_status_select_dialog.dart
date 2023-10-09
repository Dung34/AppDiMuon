import 'package:flutter/material.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../shared/etx/view_ext.dart';

class TaskStatusSelectDialog extends StatelessWidget {
  const TaskStatusSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: [
          SizedBox(
            // color: AppColor.green100,
            width: context.screenWidth - 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Status',
                  style: AppTextTheme.lexendBold18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pop(TaskStatus.notStarted);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      TaskStatusStr.notStarted,
                      style: AppTextTheme.robotoBold16
                          .copyWith(color: AppColor.blue200),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pop(TaskStatus.beginning);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      TaskStatusStr.beginning,
                      style: AppTextTheme.robotoBold16
                          .copyWith(color: AppColor.green200),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pop(TaskStatus.ended);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      TaskStatusStr.ended,
                      style: AppTextTheme.robotoBold16
                          .copyWith(color: AppColor.yellow),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pop(TaskStatus.late);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      TaskStatusStr.late,
                      style: AppTextTheme.robotoBold16
                          .copyWith(color: AppColor.red200),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
