import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../../shared/widgets/button/secondary_button.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../cubit/event_cubit.dart';

class EventItem extends StatelessWidget {
  final Event event;
  late int hasOccurred;
  final bool inCheckInPage;

  EventItem({
    super.key,
    required this.event,
    this.inCheckInPage = false,
  });

  @override
  Widget build(BuildContext context) {
    hasOccurred = DateTime.now().isBefore(
            DateTime.tryParse(event.startTime ?? '') ?? DateTime.now())
        ? -1
        : (DateTime.now().isBefore(
                DateTime.tryParse(event.endTime ?? '') ?? DateTime.now())
            ? 0
            : 1);

    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: AppColor.primary50))),
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: PrimaryNetworkImage(
            imageUrl: event.background,
            height: context.screenWidth * 0.156,
            width: context.screenWidth * 0.156,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateTimeUtils.formatDate(event.startTime ?? '')} - ${DateTimeUtils.formatDate(event.endTime ?? '')}',
              style: AppTextTheme.robotoRegular12.copyWith(fontSize: 10),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
                width: context.screenWidth * 0.68,
                child: Text(
                  event.title ?? '',
                  style: AppTextTheme.robotoMedium16,
                )),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SecondaryButton(
                  backgroundColor:
                      hasOccurred == 1 ? AppColor.red : AppColor.secondary500,
                  context: context,
                  height: 18,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Text(
                    hasOccurred == -1 ? 'Sắp diễn ra' : 'Đã kết thúc',
                    style: AppTextTheme.robotoBold14
                        .copyWith(fontSize: 12, color: AppColor.white),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                SecondaryButton(
                  backgroundColor: AppColor.secondary50,
                  context: context,
                  height: 18.0,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child:
                      Text(hasOccurred == 1 ? 'Đã tham gia' : 'Tham gia ngay'),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        PrimaryIconButton(
            context: context,
            icon: Icons.arrow_circle_right_outlined,
            iconColor: AppColor.third600,
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.eventDetail,
                  arguments: EventDetailPageArgs(
                    eventId: event.id!,
                    eventCubit: context.read<EventCubit>(),
                    isFromCalendar: false,
                  ));
            })
      ]),
    );
  }
}
