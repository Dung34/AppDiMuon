import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/user/user.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';
import '../cubit/unit_cubit.dart';

class UserItem extends StatefulWidget {
  final UnitCubit cubit;
  final UserEntity user;
  final List<UserEntity> members;
  final bool checkable;
  final bool slidable;

  const UserItem(
      {super.key,
      required this.user,
      required this.cubit,
      required this.members,
      required this.checkable,
      required this.slidable});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: widget.slidable
          ? ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                autoClose: true,
                backgroundColor: AppColor.red200,
                borderRadius: BorderRadius.circular(10.0),
                flex: 1,
                foregroundColor: AppColor.white,
                icon: Icons.delete,
                label: 'Xóa',
                onPressed: (context) {
                  // widget.cubit.deleteObjective(widget.objective.objectiveId!);
                },
              )
            ])
          : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: AppColor.white),
        height: context.screenWidth * 0.15,
        width: context.screenWidth - 10,
        child: Row(children: [
          widget.checkable
              ? Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = !checked;
                      if (checked) {
                        widget.members.add(widget.user);
                      } else {
                        widget.members
                            .removeWhere((element) => element == widget.user);
                      }
                    });
                  })
              : const SizedBox(width: 10.0),
          CircleAvatar(
            child: PrimaryCircleImage(
              imageUrl: widget.user.avatar ?? '',
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            widget.user.fullName ?? 'Unknown',
            style: AppTextTheme.robotoBold16,
          ),
        ]),
      ),
    );
  }
}
