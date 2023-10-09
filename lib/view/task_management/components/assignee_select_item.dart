import 'package:flutter/material.dart';

import '../../../domain/entity/user/user.dart';
import '../../../shared/etx/app_ext.dart';
import '../../../shared/widgets/container/primary_container.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';
import '../user_search_dialog.dart';

class AssigneeSelectItem extends StatefulWidget {
  const AssigneeSelectItem({
    super.key,
    this.onUserSelected,
    this.assignee,
    this.assigner,
  });

  final UserEntity? assignee;
  final UserEntity? assigner;
  final Function(UserEntity? user)? onUserSelected;

  @override
  State<AssigneeSelectItem> createState() => _AssigneeSelectItemState();
}

class _AssigneeSelectItemState extends State<AssigneeSelectItem> {
  UserEntity? selectedUser;

  @override
  void initState() {
    super.initState();
    selectedUser = widget.assignee ?? widget.assigner;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        UserEntity? userPop =
            await context.showAppBottomSheet(const UserSearchDialog());
        if (userPop != null) {
          setState(() {
            selectedUser = userPop;
            widget.onUserSelected?.call(userPop);
          });
        }
      },
      child: PrimaryContainer(
        padding: const EdgeInsets.all(10),
        // width: 200,
        child:
            // Row(
            //   children: [
            //     PrimaryCircleImage(
            //       imageUrl: selectedUser?.avatar ?? '',
            //     ),
            //     const SizedBox(width: 10),
            //     Text(
            //       selectedUser?.fullName ?? '',
            //     )
            //   ],
            // )
            Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            selectedUser != null
                ? Row(
                    children: [
                      PrimaryCircleImage(
                        imageUrl: selectedUser?.avatar ?? '',
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selectedUser?.fullName ?? '',
                      )
                    ],
                  )
                : const Text(
                    'Select member',
                  ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down_rounded)
          ],
        ),
      ),
    );
  }
}
