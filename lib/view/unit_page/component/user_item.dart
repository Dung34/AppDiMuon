import 'package:flutter/material.dart';

import '../../../data/resources/colors.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/user/user.dart';
import '../../../shared/etx/app_ext.dart';
import '../cubit/unit_cubit.dart';

class UserItem extends StatefulWidget {
  final UnitCubit cubit;
  final UserEntity user;

  const UserItem({super.key, required this.user, required this.cubit});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
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
                  widget.cubit.users.add(widget.user);
                } else {
                  widget.cubit.users
                      .removeWhere((element) => element == widget.user);
                }
              });
            }),
        Text(
          widget.user.fullName ?? 'Unknown',
          style: AppTextTheme.robotoRegular14,
        ),
      ]),
    );
  }
}
