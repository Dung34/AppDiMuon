import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config/routes.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../cubit/okr_cubit.dart';
import '../key_result_update_page.dart';

// ignore: must_be_immutable
class KeyResultItem extends StatefulWidget {
  final OkrCubit cubit;
  final KeyResult keyResult;

  const KeyResultItem(
      {super.key, required this.keyResult, required this.cubit});

  @override
  State<KeyResultItem> createState() => _KeyResultItemState();
}

class _KeyResultItemState extends State<KeyResultItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
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
                _onUpdateKeyResultPressed();
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
                widget.cubit.deleteKeyResult(widget.keyResult.id!);
              },
            )
          ],
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.keyResult.title}',
                    style: AppTextTheme.lexendBold16
                        .copyWith(color: AppColor.green400)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Owner', style: AppTextTheme.lexendLight14),
                        SizedBox(height: 8),
                        Text('Due Date', style: AppTextTheme.lexendLight14)
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(''),
                        const SizedBox(height: 8),
                        Text(
                          DateTimeUtils.formatDate(DateTime.now().toString()),
                          style: AppTextTheme.robotoMedium14
                              .copyWith(color: AppColor.black),
                        )
                      ],
                    ))
                  ],
                ),
                const SizedBox(height: 6)
              ],
            ),
          ),
          CircularPercentIndicator(
            center: const Text('60%', style: AppTextTheme.robotoBold16),
            lineWidth: 9,
            percent: 0.6,
            progressColor: AppColor.green200,
            radius: context.screenWidth * 50 / 428,
          ),
        ]));
  }

  _onUpdateKeyResultPressed() {
    context.showAppBottomSheet(
        KeyResultUpdatePage(keyResult: widget.keyResult, cubit: widget.cubit));
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
