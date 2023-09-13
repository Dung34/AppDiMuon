part of 'event_cubit.dart';

abstract class EventState extends Equatable {
  const EventState();
  @override
  List<Object?> get props => [];
}

class EventInitial extends EventState {}

class EventResetState extends EventState {}

class EventCurrentLocationDeniedForeverState extends EventState {}

class EventHasPermissionState extends EventState {
  final bool hasPermission;
  final CurrentLocation? currentLocation;

  const EventHasPermissionState(
      {required this.hasPermission, this.currentLocation});
}

class EventGetAllEventSuccessState extends EventState {
  final List<Event> events;

  /// if isGetRange -> return all events count 6 weeks to show in the calendar page
  final bool isGetRange;

  const EventGetAllEventSuccessState(this.events, {this.isGetRange = false});
  @override
  List<Object?> get props => [events];
}

class EventGetAllEventFailedState extends EventState {}

class EventGetAllEventRangeSuccessState extends EventState {
  final List<Event> events;

  /// if isGetRange -> return all events count 6 weeks to show in the calendar page
  final bool isGetRange;

  const EventGetAllEventRangeSuccessState(this.events,
      {this.isGetRange = false});
  @override
  List<Object?> get props => [events];
}

class EventGetAllEventRangeFailedState extends EventState {}

class EventGetAllEventTypeSuccessState extends EventState {
  final List<EventType> eventTypes;

  const EventGetAllEventTypeSuccessState(this.eventTypes);
}

class EventGetAllEventTypeFailedState extends EventState {}

class EventDeleteEventSuccessState extends EventState {}

class EventDeleteEventFailedState extends EventState {
  @override
  List<Object?> get props => [DateTime.now()];
}

class EventGetAllMemberSuccessState extends EventState {
  final List<EventMember> eventMembers;

  const EventGetAllMemberSuccessState(this.eventMembers);
  @override
  List<Object?> get props => [eventMembers];
}

class EventGetAllMemberFailedState extends EventState {}

class EventGetAllHistorySuccessState extends EventState {
  final List<EventMember> eventMembers;

  const EventGetAllHistorySuccessState(this.eventMembers);
  @override
  List<Object?> get props => [eventMembers];
}

class EventGetAllHistoryFailedState extends EventState {}

class EventAddEventSuccessState extends EventState {
  final Event event;

  const EventAddEventSuccessState(this.event);
  @override
  List<Object?> get props => [event];
}

class EventAddEventFailedState extends EventState {}

class EventUpdateEventSuccessState extends EventState {
  final Event event;

  const EventUpdateEventSuccessState(this.event);
  @override
  List<Object?> get props => [event];
}

class EventUpdateEventFailedState extends EventState {}

class EventGetEventByIdSuccessState extends EventState {
  final Event event;

  const EventGetEventByIdSuccessState(this.event);
  @override
  List<Object?> get props => [event];
}

class EventGetEventByIdFailedState extends EventState {}

class EventGetEventByFilterSuccessState extends EventState {
  final List<Event> events;

  const EventGetEventByFilterSuccessState(this.events);
  @override
  List<Object?> get props => [events];
}

class EventGetEventByFliterFailedState extends EventState {}

class EventGetQRCodeSuccessState extends EventState {
  final String imageLink;

  const EventGetQRCodeSuccessState(this.imageLink);
}

class EventJoinEventSuccessState extends EventState {
  final UserEventJoined userEventJoined;
  final bool isUserScan;

  const EventJoinEventSuccessState(this.userEventJoined,
      {this.isUserScan = false});
  @override
  List<Object?> get props => [userEventJoined, isUserScan];
}

class EventJoinEventFailedState extends EventState {}

class EventJoinInEventSucessState extends EventState {}

class EventJoinInEventFailedState extends EventState {}

class EventShowFullDayState extends EventState {
  final bool isShow;

  const EventShowFullDayState(this.isShow);
  @override
  List<Object?> get props => [isShow];
}

class EventFilterChangeState extends EventState {
  final int count;

  const EventFilterChangeState(this.count);
  @override
  List<Object?> get props => [count];
}

class EventShowSearchBarState extends EventState {
  final bool isShow;

  const EventShowSearchBarState(this.isShow);

  @override
  List<Object?> get props => [isShow];
}

class EventCheckedRangeDateTimeState extends EventState {
  final bool isSastified;
  final String startTime;
  final String endTime;

  const EventCheckedRangeDateTimeState({
    required this.isSastified,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [isSastified, startTime, endTime];
}
