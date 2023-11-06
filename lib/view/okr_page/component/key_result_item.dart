import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/key_result/key_result.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';
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
      child: Container(
        constraints: BoxConstraints(
            minHeight: context.screenWidth * 0.6 / 16 * 9,
            maxWidth: context.screenWidth * 0.6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: AppColor.blue50),
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                PrimaryContainer(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.keyResult.key.toString(),
                        style: AppTextTheme.lexendBold16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                PrimaryContainer(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.keyResult.result.toString(),
                        style: AppTextTheme.lexendBold16,
                      ),
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Text(widget.keyResult.description!,
                  style: AppTextTheme.robotoLight12),
            ],
          ),
        ),
      ),
    );
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
    return Container(
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
