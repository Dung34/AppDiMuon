part of 'event_cubit.dart';

abstract class EventState {
  const EventState();
}

class EventInitial extends EventState {}

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
