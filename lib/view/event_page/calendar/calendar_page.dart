import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes.dart';
import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../../shared/widgets/shimmer/container_shimmer.dart';
import '../../../shared/widgets/shimmer/primary_shimmer.dart';
import '../../../shared/widgets/something/no_data.dart';
import '../../../shared/widgets/something/primary_calendar.dart';
import '../../base/base_page_sate.dart';
import '../cubit/event_cubit.dart';
import 'calendar_add_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends BasePageState<CalendarPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getAllEvent(date: DateTime.now().toString());
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        PrimaryCalendar(
          onSelectedDate: (date) {
            cubit.getAllEvent(date: date.toString());
          },
          actions: [
            if (userCubit.currentUser?.role == UserRole.admin)
              PrimaryIconButton(
                context: context,
                onPressed: () {
                  _onAddEventPressed(context);
                },
                icon: Assets.icAdd,
              ),
          ],
        ),
        BlocBuilder<EventCubit, EventState>(
          buildWhen: (previous, current) =>
              current is EventGetAllEventSuccessState ||
              current is EventInitial ||
              current is EventGetAllMemberFailedState,
          builder: (context, state) {
            if (state is EventGetAllEventSuccessState) {
              final events = state.events;
              return Expanded(
                child: events.isNotEmpty
                    ? ListView.separated(
                        itemCount: events.length,
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final event = events[index];
                          return Row(
                            children: [
                              Text(
                                DateTimeUtils.formatDate(event.startTime ?? '',
                                    showOnlyTime: true),
                                style: AppTextTheme.robotoBold18
                                    .copyWith(color: AppColor.secondary400),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.primary50,
                                      border: Border(
                                        left: BorderSide(
                                          color: AppColor.secondary400,
                                          width: 4,
                                        ),
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              event.title ?? '',
                                              style: AppTextTheme.lexendBold16,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              event.location ?? '',
                                              style:
                                                  AppTextTheme.robotoRegular14,
                                            )
                                          ],
                                        ),
                                      ),
                                      if (userCubit.currentUser?.role ==
                                          UserRole.admin)
                                        const SizedBox(width: 4),
                                      if (userCubit.currentUser?.role ==
                                          UserRole.admin)
                                        PrimaryIconButton(
                                          context: context,
                                          backgroundColor: AppColor.transparent,
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              AppRoute.eventQr,
                                              arguments:
                                                  EventQrPageArgs(event: event),
                                            );
                                          },
                                          icon: Assets.icQrCode,
                                        ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                      )
                    : const Center(
                        child: NoData(),
                      ),
              );
            } else {
              return Expanded(
                child: PrimaryShimmer(
                  child: ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      return const Row(
                        children: [
                          ContainerShimmer(width: 100),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContainerShimmer(width: double.infinity),
                              SizedBox(
                                height: 4,
                              ),
                              ContainerShimmer(width: 80),
                            ],
                          ))
                        ],
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  void _onAddEventPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CalendarAddPage(
        eventCubit: cubit,
      ),
    ));
  }
}
