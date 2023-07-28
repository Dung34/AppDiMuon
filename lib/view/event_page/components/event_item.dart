import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes.dart';
import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../shared/etx/view_ext.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/button/primary_button.dart';
import '../../../shared/widgets/image/primary_image.dart';
import '../cubit/event_cubit.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final bool inCheckInPage;
  const EventItem({
    super.key,
    required this.event,
    this.inCheckInPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.eventDetail,
          arguments: EventDetailPageArgs(
            eventId: event.id!,
            eventCubit: context.read<EventCubit>(),
            isFromCalendar: false,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: PrimaryNetworkImage(
                imageUrl: event.background,
                height: (context.screenWidth - 32) * 9 / 16,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${event.title}',
              style: AppTextTheme.lexendBold18.copyWith(
                  overflow: TextOverflow.ellipsis, color: AppColor.primary900),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              '${event.description}',
              style: AppTextTheme.robotoRegular12.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColor.secondary500),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (!inCheckInPage)
                  PrimaryButton(
                    context: context,
                    onPressed: () {},
                    label: event.statusStr,
                    backgroundColor: event.status == EventStatus.notStarted
                        ? AppColor.third400
                        : event.status == EventStatus.begining
                            ? AppColor.secondary400
                            : event.status == EventStatus.finished
                                ? AppColor.fourth600
                                : AppColor.error400,
                    contentPadding: 8,
                  ),
                if (!inCheckInPage) const SizedBox(width: 10),
                if (!inCheckInPage)
                  PrimaryButton(
                    context: context,
                    onPressed: () {},
                    isClickable: false,
                    icon: event.checked ? Assets.icStar : null,
                    iconColor: AppColor.white,
                    backgroundColor: event.checked
                        ? AppColor.green
                        : event.status != EventStatus.finished && !event.checked
                            ? AppColor.error400
                            : AppColor.fourth600,
                    label: event.checked
                        ? 'Đã tham dự'
                        : event.status == EventStatus.finished && !event.checked
                            ? 'Không tham dự'
                            : 'Chưa tham dự',
                    contentPadding: 8,
                  ),
                if (inCheckInPage)
                  PrimaryButton(
                    context: context,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoute.qrScanner,
                        arguments: QrScannerPageArgs(
                          userRole: UserRole.admin,
                          eventId: event.id,
                        ),
                      );
                    },
                    icon: Assets.icQrCode,
                    iconColor: AppColor.white,
                    label: 'Quét mã',
                    contentPadding: 8,
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icClock),
                          const SizedBox(width: 4),
                          Text(
                            'Bắt đầu: ${DateTimeUtils.formatDate(
                              event.startTime ?? '',
                              showOnlyTime: true,
                            )} ${DateTimeUtils.formatDate(event.startTime ?? '')}',
                            textAlign: TextAlign.start,
                            style: AppTextTheme.robotoMedium12.copyWith(
                              color: AppColor.secondary500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icLocation),
                          const SizedBox(width: 4),
                          Text(
                            event.location!,
                            textAlign: TextAlign.start,
                            style: AppTextTheme.robotoMedium12.copyWith(
                              color: AppColor.secondary500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(Assets.icPeople),
                Text(
                  event.totalUserCount.toString(),
                  style: AppTextTheme.robotoMedium12
                      .copyWith(color: AppColor.secondary500),
                ),
                // Expanded(
                //   child: Text(
                //     'Bắt đầu: ${DateTimeUtils.formatDate(
                //       event.startTime ?? '',
                //       showOnlyTime: true,
                //     )} ${DateTimeUtils.formatDate(event.startTime ?? '')}',
                //     textAlign: TextAlign.end,
                //     style: AppTextTheme.robotoMedium12.copyWith(
                //       color: AppColor.fourth700,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            // Row(
            //   children: [
            //     PrimaryCircleImage(
            //       imageUrl: event.userAvatar ?? '',
            //       radius: 16,
            //     ),
            //     const SizedBox(width: 8),
            //     Expanded(
            //       child: Text(
            //         event.userFullname ?? '',
            //         style: AppTextTheme.robotoMedium12
            //             .copyWith(color: AppColor.primary500),
            //       ),
            //     ),
            //     // IconButton(
            //     //   onPressed: () {},
            //     //   icon: SvgPicture.asset(Assets.icMenuDot),
            //     // )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
