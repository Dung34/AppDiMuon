part of 'event_cubit.dart';

abstract class EventState {
  const EventState();
}

class EventInitial extends EventState {}

class EventCurrentLocationDeniedForeverState extends EventState {}

class EventHasPermissionState extends EventState {
  final bool hasPermission;
  final CurrentLocation? currentLocation;

  EventHasPermissionState({required this.hasPermission, this.currentLocation});
}

class EventGetAllEventSuccessState extends EventState {
  final List<Event> events;

  const EventGetAllEventSuccessState(this.events);
}

class EventGetAllEventFailedState extends EventState {}

class EventGetAllEventTypeSuccessState extends EventState {
  final List<EventType> eventTypes;

  const EventGetAllEventTypeSuccessState(this.eventTypes);
}

class EventGetAllEventTypeFailedState extends EventState {}

class EventGetAllMemberSuccessState extends EventState {
  final List<EventMember> eventMembers;

  const EventGetAllMemberSuccessState(this.eventMembers);
}

class EventGetAllMemberFailedState extends EventState {}

class EventGetAllHistorySuccessState extends EventState {
  final List<EventMember> eventMembers;

  const EventGetAllHistorySuccessState(this.eventMembers);
}

class EventGetAllHistoryFailedState extends EventState {}

class EventAddEventSuccessState extends EventState {
  final Event event;

  const EventAddEventSuccessState(this.event);
}

class EventAddEventFailedState extends EventState {}

class EventShowFullDayState extends EventState {
  final bool isShow;

  EventShowFullDayState(this.isShow);
}

class EventCheckedRangeDateTimeState extends EventState {
  final bool isSastified;
  final String startTime;
  final String endTime;

  EventCheckedRangeDateTimeState({
    required this.isSastified,
    required this.startTime,
    required this.endTime,
  });
}
