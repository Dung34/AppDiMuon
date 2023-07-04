import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/resources/resources.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';

class PrimaryCalendar extends StatefulWidget {
  final Function(DateTime date) onSelectedDate;
  final List<Widget>? actions;
  const PrimaryCalendar(
      {super.key, required this.onSelectedDate, this.actions});

  @override
  State<PrimaryCalendar> createState() => _PrimaryCalendarState();
}

class _PrimaryCalendarState extends State<PrimaryCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
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
            DateFormat.yMMMM(locale).format(date),
        titleTextStyle: AppTextTheme.lexendBold24,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Tháng',
        CalendarFormat.week: 'Tuần',
      },
      // eventLoader: (day) {
      //   // log('day: $day ${_getEventsForDay(day)}');
      //   return _getEventsForDay(day);
      // },
      onDaySelected: (selectedDay, focusedDay) {
        if (isSameDay(_selectedDay, selectedDay)) return;
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        widget.onSelectedDate.call(_selectedDay);
      },
      calendarFormat: _calendarFormat,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          return events.isNotEmpty
              ? Container(
                  width: 8,
                  height: 8,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primary400), //Change color
                )
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
    );
  }
}

List<Event> _getEventsForDay(DateTime day) {
  // Implementation example
  return kEvents[day] ?? [];
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(2023, 7, item): List.generate(
      1,
      (index) => Event(
        title: 'Event $item | ${index + 1}',
      ),
    )
}..addAll({
    DateTime.now(): [
      Event(title: 'Today\'s Event 1'),
      Event(title: 'Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
