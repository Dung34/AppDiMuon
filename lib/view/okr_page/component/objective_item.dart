import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../cubit/okr_cubit.dart';
import '../objective_update_page.dart';

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
        constraints: BoxConstraints(
            minHeight: context.screenWidth * 0.1,
            minWidth: context.screenWidth - 10),
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
          PrimaryContainer(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.objective.title.toString(),
                  style: AppTextTheme.lexendBold16,
                ),
                const SizedBox(height: 10),
                Text(
                    'Due date: ${DateTimeUtils.formatDate(DateTime.now().toString())}')
              ],
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
