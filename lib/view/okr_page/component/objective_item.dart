import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../cubit/okr_cubit.dart';
import '../objective_update_page.dart';
import 'key_result_item.dart';

// ignore: must_be_immutable
class ObjectiveItem extends StatefulWidget {
  final OkrCubit cubit;
  final Objective objective;
  List<String>? related;
  final bool checkable;
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
                    widget.cubit.deleteObjective(widget.objective.objectiveId!);
                  },
                )
              ],
            )
          : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: AppColor.white),
        child: Row(children: [
          widget.checkable
              ? Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = !checked;
                      if (checked) {
                        widget.related!.add(widget.objective.objectiveId!);
                      } else {
                        widget.related!.removeWhere((element) =>
                            element == widget.objective.objectiveId!);
                      }
                    });
                  })
              : Container(),
          Expanded(
            child: PrimaryContainer(
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(1, 1),
                    spreadRadius: 1)
              ],
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.blue50,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15),
                    child: Row(children: [
                      CircularPercentIndicator(
                        center:
                            const Text('60%', style: AppTextTheme.robotoBold16),
                        lineWidth: 7,
                        percent: 0.6,
                        progressColor: AppColor.green200,
                        radius: context.screenWidth * 55 / 428,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.objective.title}',
                              style: AppTextTheme.lexendBold16
                                  .copyWith(color: AppColor.green400)),
                          const SizedBox(height: 10),
                          Text('${widget.objective.description}',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.robotoLight12)
                        ],
                      ),
                      // const Flexible(child: Spacer()),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due date:',
                              style: AppTextTheme.robotoRegular14
                                  .copyWith(color: AppColor.gray300)),
                          Text(
                            DateTimeUtils.formatDate(DateTime.now().toString()),
                            style: AppTextTheme.robotoMedium14
                                .copyWith(color: AppColor.black),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Text('10 người khác')
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _onUpdateObjectivePressed() {
    context.showAppBottomSheet(
        ObjectiveUpdatePage(cubit: widget.cubit, objective: widget.objective));
  }
}
