import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes.dart';
import '../../data/constant/constants.dart';
import '../../data/resources/resources.dart';
import '../../shared/etx/view_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/image/primary_image.dart';
import '../../shared/widgets/something/primary_app_bar.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = context.arguments as EventDetailPageArgs;
    final event = args.event;
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      appBar: PrimaryAppBar(
        title: 'Thông tin chi tiết',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  style: AppTextTheme.lexendBold18
                      .copyWith(color: AppColor.primary900),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
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
                    const SizedBox(width: 10),
                    PrimaryButton(
                      context: context,
                      onPressed: () {},
                      icon: event.checked ? Assets.icStar : null,
                      iconColor: AppColor.white,
                      backgroundColor: event.checked
                          ? AppColor.third400
                          : event.status == EventStatus.finished &&
                                  !event.checked
                              ? AppColor.error400
                              : AppColor.fourth600,
                      label: event.checked
                          ? 'Đã tham dự'
                          : event.status == EventStatus.finished &&
                                  !event.checked
                              ? 'Không tham dự'
                              : 'Chưa tham dự',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                event.location ?? 'Chưa cập nhật',
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoute.eventMember,
                          arguments:
                              EventMemberPageArgs(eventId: event.id ?? ''),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.icPeople),
                          const SizedBox(width: 4),
                          Text(
                            event.totalUserCount.toString(),
                            style: AppTextTheme.robotoMedium12
                                .copyWith(color: AppColor.secondary500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${event.description}',
                  style: AppTextTheme.robotoRegular12.copyWith(
                    color: AppColor.secondary500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
