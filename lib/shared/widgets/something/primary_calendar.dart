import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../etx/app_ext.dart';
import '../../utils/date_time_utils.dart';
import '../table_calendar/table_calendar.dart';

class PrimaryCalendar extends StatefulWidget {
  final Function(DateTime date) onSelectedDate;
  final Function(DateTime date) onPageChanged;
  final List<Widget>? actions;
  final List<Event> initialEvent;
  final DateTime? focusedDay;
  final List<Object?> Function(DateTime)? eventLoader;

  const PrimaryCalendar(
      {super.key,
      required this.onSelectedDate,
      this.actions,
      required this.onPageChanged,
      this.initialEvent = const [],
      this.focusedDay,
      this.eventLoader});

  @override
  State<PrimaryCalendar> createState() => _PrimaryCalendarState();
}

class _PrimaryCalendarState extends State<PrimaryCalendar> {
  DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay;
  @override
  void initState() {
    _focusedDay = widget.focusedDay ?? DateTime.now();
    super.initState();
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(1900, 1, 1),
      lastDay: DateTime.utc(3000, 12, 31),
      focusedDay: _focusedDay,
      actions: widget.actions,
      locale: 'vi_en',
      headerVisible: true,
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
        formatButtonVisible: false,
        titleTextFormatter: (date, locale) =>
            capitalize(DateFormat.yMMMM(locale).format(date)),
        titleTextStyle: AppTextTheme.lexendBold24,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Tháng',
        CalendarFormat.week: 'Tuần',
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (isSameDay(_selectedDay, selectedDay)) return;
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        widget.onSelectedDate.call(_selectedDay);
      },
      onPageChanged: (focusedDay) {
        widget.onPageChanged.call(focusedDay);
      },
      calendarFormat: _calendarFormat,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          final dayMapper = widget.initialEvent.firstWhere(
            (element) => DateTimeUtils.isSameDay(
                element.startDate ?? '', day.toIso8601String()),
            orElse: () => Event(),
          );
          return dayMapper.id != null
              ? day != DateTime.now()
                  ? Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.secondary400),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 2.0),
                          height: context.screenWidth / 12,
                          width: context.screenWidth / 12,
                          child: Text(
                            '${day.day}',
                            style: AppTextTheme.robotoRegular14
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox()
              : const SizedBox();
        },
      ),
      formatAnimationDuration: const Duration(milliseconds: 300),
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarStyle: CalendarStyle(
        defaultTextStyle: AppTextTheme.robotoRegular14,
        markersAlignment: Alignment.bottomRight,
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.secondary500,
          ),
        ),
        todayTextStyle: AppTextTheme.robotoRegular14,
        markerDecoration: const ShapeDecoration(
          color: AppColor.red,
          shape: RoundedRectangleBorder(),
        ),
        selectedTextStyle: const TextStyle(color: AppColor.white),
        selectedDecoration: const BoxDecoration(
          color: AppColor.secondary500,
          shape: BoxShape.circle,
        ),
      ),
      eventLoader: widget.eventLoader,
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
