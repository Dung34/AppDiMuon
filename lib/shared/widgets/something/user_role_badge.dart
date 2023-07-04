import 'package:flutter/material.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../container/primary_container.dart';

class UserRoleBadge extends StatelessWidget {
  final int type;
  const UserRoleBadge({super.key, this.type = UserRole.user});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      borderColor:
          type == UserRole.user ? AppColor.secondary500 : AppColor.white,
      borderWidth: 3,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      backgroundColor:
          type == UserRole.user ? AppColor.white : AppColor.secondary400,
      borderRadius: 56,
      child: Text(
        type == UserRole.user ? 'Thành viên' : 'Quản trị viên',
        style: AppTextTheme.robotoMedium14.copyWith(
            color:
                type == UserRole.user ? AppColor.secondary500 : AppColor.white),
      ),
    );
  }
}
