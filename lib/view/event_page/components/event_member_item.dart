import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../data/resources/colors.dart';
import '../../../data/resources/themes.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/image/primary_circle_image.dart';

class EventMemberItem extends StatelessWidget {
  final EventMember eventMember;
  const EventMemberItem({super.key, required this.eventMember});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.eventMemberHistory,
            arguments: EventMemberHistoryPageArgs(userId: eventMember.userId));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.secondary500,
              child: PrimaryCircleImage(
                radius: 18,
                imageUrl: eventMember.avatar ?? '',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        eventMember.fullname ?? '',
                        maxLines: 2,
                        style: AppTextTheme.robotoBold16.copyWith(
                            color: AppColor.primary500,
                            overflow: TextOverflow.ellipsis),
                      )),
                      const SizedBox(width: 4),
                      Text(
                        DateTimeUtils.formatDate(
                            eventMember.checkedInDate ?? '',
                            showTime: true),
                        textAlign: TextAlign.start,
                        style: AppTextTheme.robotoRegular12.copyWith(
                          color: AppColor.primary400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    eventMember.checkedInLocation ?? '',
                    style: AppTextTheme.robotoLight12.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
