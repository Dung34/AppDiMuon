import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constant/constants.dart';
import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../shared/utils/date_time_utils.dart';
import '../../../shared/widgets/button/primary_icon_button.dart';
import '../../../shared/widgets/shimmer/container_shimmer.dart';
import '../../../shared/widgets/shimmer/primary_shimmer.dart';
import '../../../shared/widgets/something/no_data.dart';
import '../../../shared/widgets/something/primary_calendar.dart';
import '../../base/base_page_sate.dart';
import '../cubit/event_cubit.dart';
import '../event_add_page.dart';
import 'components/calendar_event_item.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends BasePageState<CalendarPage, EventCubit> {
  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    cubit
      ..getAllEvent(
          startDate: DateTime(today.year, today.month, -7).toIso8601String(),
          endDate: DateTime(today.year, today.month, 37).toIso8601String())
      ..getAllEvent(date: DateTime.now().toString());
  }

  DateTime currentSelectedDate = DateTime.now();
  DateTime focusDate = DateTime.now();

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<EventCubit, EventState>(
          buildWhen: (previous, current) =>
              current is EventGetAllEventRangeSuccessState,
          builder: (context, state) {
            return state is EventGetAllEventRangeSuccessState
                ? PrimaryCalendar(
                    key: UniqueKey(),
                    onSelectedDate: (date) {
                      currentSelectedDate = date;
                      cubit.getAllEvent(date: currentSelectedDate.toString());
                    },
                    focusedDay: focusDate,
                    onPageChanged: (date) {
                      focusDate = date;
                      cubit.getAllEvent(
                          startDate: DateTime(date.year, date.month, -7)
                              .toIso8601String(),
                          endDate: DateTime(date.year, date.month, 37)
                              .toIso8601String());
                    },
                    initialEvent: List.from(
                      state.events.map(
                        (e) => Event(
                          id: '',
                          startTime: DateTimeUtils.toDateTime(e.startTime ?? '')
                              .toIso8601String(),
                          endTime: DateTimeUtils.toDateTime(e.endTime ?? '')
                              .toIso8601String(),
                        ),
                      ),
                    ),
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
                  )
                : PrimaryShimmer(
                    child: PrimaryCalendar(
                      onSelectedDate: (date) {},
                      onPageChanged: (date) {},
                    ),
                  );
          },
        ),
        BlocBuilder<EventCubit, EventState>(
          buildWhen: (previous, current) {
            return current is EventGetAllEventSuccessState ||
                current is EventInitial ||
                current is EventGetAllMemberFailedState;
          },
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
                          return index < events.length - 1
                              ? CalendarEventItem(
                                  event: event,
                                  userRole: userCubit.currentUser?.role ?? 0)
                              : Column(
                                  children: [
                                    CalendarEventItem(
                                        event: event,
                                        userRole:
                                            userCubit.currentUser?.role ?? 0),
                                    const SizedBox(
                                      height: 100,
                                    ),
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
        currentSelectedDate: currentSelectedDate,
      ),
    ));
  }
}
