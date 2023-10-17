import 'package:flutter/material.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/okr/objective/objective.dart';
import '../../../shared/etx/app_ext.dart';
import '../cubit/okr_cubit.dart';

// ignore: must_be_immutable
class ObjectiveItem extends StatefulWidget {
  final OkrCubit cubit;
  final Objective objective;
  List<String> related;

  ObjectiveItem(
      {super.key,
      required this.objective,
      required this.cubit,
      required this.related});

  @override
  State<ObjectiveItem> createState() => _ObjectiveItemState();
}

class _ObjectiveItemState extends State<ObjectiveItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: AppColor.white),
      height: context.screenWidth * 0.1,
      width: context.screenWidth - 10,
      child: Row(children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = !checked;
                if (checked) {
                  widget.related.add(widget.objective.objectiveId!);
                } else {
                  widget.related.removeWhere(
                      (element) => element == widget.objective.objectiveId!);
                }
              });
            }),
        Text(
          widget.objective.title ?? 'Unknown',
          style: AppTextTheme.robotoRegular14,
        ),
      ]),
    );
  }
}
