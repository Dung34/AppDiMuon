import 'package:flutter/material.dart';

import '../../../../config/routes.dart';
import '../../../../data/constant/constants.dart';
import '../../../../data/resources/resources.dart';
import '../../../../domain/entity/event/event_wrapper/event.dart';
import '../../../../shared/utils/date_time_utils.dart';
import '../../../../shared/widgets/button/primary_icon_button.dart';

class CalendarEventItem extends StatelessWidget {
  final Event event;
  final int userRole;
  const CalendarEventItem(
      {super.key, required this.event, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoute.eventDetail,
          arguments: EventDetailPageArgs(eventId: event.id!)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              DateTimeUtils.formatDate(event.startTime ?? '',
                  showOnlyTime: true),
              style: AppTextTheme.robotoBold18
                  .copyWith(color: AppColor.secondary400),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.primary50,
                  border: Border(
                    left: BorderSide(
                      color: AppColor.secondary400,
                      width: 4,
                    ),
                  )),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title ?? '',
                          style: AppTextTheme.lexendBold16,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        if (event.location != null)
                          Text(
                            event.location ?? '',
                            style: AppTextTheme.robotoRegular14,
                          )
                      ],
                    ),
                  ),
                  if (userRole == UserRole.admin) const SizedBox(width: 4),
                  if (userRole == UserRole.admin)
                    PrimaryIconButton(
                      context: context,
                      backgroundColor: AppColor.transparent,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoute.eventQr,
                          arguments: EventQrPageArgs(event: event),
                        );
                      },
                      icon: Assets.icQrCode,
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
