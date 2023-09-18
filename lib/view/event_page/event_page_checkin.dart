import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/event/checkin_statistic/checkin_statistic.dart';
import '../../domain/entity/event/event_wrapper/event.dart';
import '../../shared/etx/app_ext.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/shimmer/primary_shimmer.dart';
import '../../shared/widgets/something/center_outlined_text_filed.dart';
import '../../shared/widgets/something/primary_calendar.dart';
import '../base/base_page_sate.dart';
import 'calendar/calendar_page.dart';
import 'cubit/event_cubit.dart';

class EventPageCheckin<EventCubit> extends StatefulWidget {
  const EventPageCheckin({super.key});

  @override
  State<EventPageCheckin> createState() => _EventPageCheckin();
}

class _EventPageCheckin extends BasePageState<EventPageCheckin, EventCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllEvent();
    userCubit.getUser();
    cubit.getCheckinStatistic(userCubit.currentUser?.id);

    final today = DateTime.now();
    cubit.getAllCalendarEvent(
        startDate: today.subtract(const Duration(days: 365)).toIso8601String(),
        endDate: today.add(const Duration(days: 365)).toIso8601String());
  }

  @override
  Widget buildPage(BuildContext context) {
    CheckinStatistic? checkinStatistic;
    int daysOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            'Thống kê check-in tháng ${DateTime.now().month}/${DateTime.now().year}',
            textAlign: TextAlign.center,
            style: AppTextTheme.lexendBold18
                .copyWith(color: AppColor.secondary500),
          ),
          const SizedBox(height: 8.0),
          BlocBuilder<EventCubit, EventState>(
              buildWhen: (previous, current) =>
                  current is EventGetCheckinStatisticSuccessState ||
                  current is EventGetCheckinStatisticFailedState,
              builder: (context, state) {
                if (state is EventGetCheckinStatisticSuccessState) {
                  checkinStatistic = state.props[0] as CheckinStatistic;
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (context.screenWidth - 32) / 3,
                        child: CenterOutlinedTextField(
                          enabledTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          focusedTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          label: 'Ngày công',
                          labelStyle: AppTextTheme.robotoRegular12
                              .copyWith(color: AppColor.primary500),
                          paddingLabel: const EdgeInsets.all(4.0),
                          paddingTextField: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                              left: context.screenWidth * 0.015,
                              right: context.screenWidth * 0.015),
                          readOnly: true,
                          text:
                              '${checkinStatistic?.workDay ?? 0}/$daysOfMonth',
                          textFieldStyle: AppTextTheme.robotoRegular14,
                        ),
                      ),
                      SizedBox(
                        width: (context.screenWidth - 32) / 3,
                        child: CenterOutlinedTextField(
                          enabledTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          focusedTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          label: 'Đi muộn',
                          labelStyle: AppTextTheme.robotoRegular12
                              .copyWith(color: AppColor.primary500),
                          paddingLabel: const EdgeInsets.all(4.0),
                          paddingTextField: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                              left: context.screenWidth * 0.015,
                              right: context.screenWidth * 0.015),
                          readOnly: true,
                          text:
                              '${checkinStatistic?.lateDay ?? 0}/$daysOfMonth',
                          textFieldStyle: AppTextTheme.robotoRegular14,
                        ),
                      ),
                      SizedBox(
                        width: (context.screenWidth - 32) / 3,
                        child: CenterOutlinedTextField(
                          enabledTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          focusedTextFieldBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColor.secondary200)),
                          label: 'Nghỉ làm',
                          labelStyle: AppTextTheme.robotoRegular12
                              .copyWith(color: AppColor.primary500),
                          paddingLabel: const EdgeInsets.all(4.0),
                          paddingTextField: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                              left: context.screenWidth * 0.015,
                              right: context.screenWidth * 0.015),
                          readOnly: true,
                          text:
                              '${checkinStatistic?.leaveDay ?? 0}/$daysOfMonth',
                          textFieldStyle: AppTextTheme.robotoRegular14,
                        ),
                      ),
                    ]);
              }),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: (context.screenWidth - 48) / 2,
                child: PrimaryButton(
                  backgroundColor: AppColor.secondary500,
                  context: context,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.dailyReport);
                  },
                  label: 'Báo cáo hàng ngày',
                  textStyle:
                      AppTextTheme.textButtonPrimary.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: (context.screenWidth - 48) / 2,
                child: PrimaryButton(
                  backgroundColor: AppColor.primary50,
                  context: context,
                  onPressed: () {},
                  label: 'Báo cáo tổng quan',
                  textStyle: AppTextTheme.textButtonPrimary
                      .copyWith(color: AppColor.primary500, fontSize: 12),
                ),
              ),
            ],
          ),
          BlocBuilder<EventCubit, EventState>(
            buildWhen: (previous, current) =>
                current is EventGetAllEventRangeSuccessState,
            builder: (context, state) {
              return state is EventGetAllEventRangeSuccessState
                  ? PrimaryCalendar(
                      actions: [
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: AppColor.third600,
                          ),
                          onPressed: () {},
                        ),
                      ],
                      initialEvent: List.from(state.events.map((e) => Event(
                            id: '',
                            startDate:
                                DateTimeUtils.toDateTime(e.startDate ?? '')
                                    .toIso8601String(),
                            endDate: DateTimeUtils.toDateTime(e.endDate ?? '')
                                .toIso8601String(),
                          ))),
                      key: UniqueKey(),
                      onPageChanged: (value) {
                        cubit.getAllCalendarEvent(
                            startDate: DateTime.now()
                                .subtract(const Duration(days: 365))
                                .toIso8601String(),
                            endDate: DateTime.now()
                                .add(const Duration(days: 365))
                                .toIso8601String());
                      },
                      onSelectedDate: (value) {
                        cubit.getAllEvent();
                      },
                    )
                  : PrimaryShimmer(
                      child: PrimaryCalendar(
                        onPageChanged: (date) {},
                        onSelectedDate: (date) {},
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
