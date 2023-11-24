import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../cubit/okr_cubit.dart';
import '../objective_update_page.dart';
import 'key_result_item.dart';

// ignore: must_be_immutable
class ObjectiveItem extends StatefulWidget {
  final OkrCubit cubit;
  final Objective objective;
  List<String>? related;
  final bool checkable; // For select plural items
  final bool slidable;
  final bool isAdmin;

  ObjectiveItem(
      {super.key,
      required this.objective,
      required this.cubit,
      this.related,
      this.checkable = false,
      this.slidable = false,
      required this.isAdmin});

  @override
  State<ObjectiveItem> createState() => _ObjectiveItemState();
}

class _ObjectiveItemState extends State<ObjectiveItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: widget.slidable && widget.isAdmin
            ? ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    autoClose: true,
                    backgroundColor: AppColor.blue200,
                    borderRadius: BorderRadius.circular(10.0),
                    flex: 1,
                    foregroundColor: AppColor.white,
                    icon: Icons.edit,
                    label: 'Sửa objective',
                    onPressed: (context) {
                      _onUpdateObjectivePressed();
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
                    label: 'Xóa Objective',
                    onPressed: (context) {
                      widget.cubit
                          .deleteObjective(widget.objective.objectiveId!);
                    },
                  )
                ],
              )
            : null,
        child: Row(children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: AppColor.white),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.objective.title}',
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
                              Text('Due Date',
                                  style: AppTextTheme.lexendLight14)
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(''),
                              const SizedBox(height: 8),
                              Text(
                                DateTimeUtils.formatDate(
                                    DateTime.now().toString()),
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
                  center: Text('${(widget.objective.process ?? 0.0).ceil()}%',
                      style: AppTextTheme.robotoBold16),
                  lineWidth: 9,
                  percent: widget.objective.process ?? 0,
                  progressColor: AppColor.green200,
                  radius: context.screenWidth * 50 / 428,
                ),
              ]),
            ),
          ),
        ]));
  }

  _onUpdateObjectivePressed() {
    context.showAppBottomSheet(
        ObjectiveUpdatePage(cubit: widget.cubit, objective: widget.objective));
  }
}
