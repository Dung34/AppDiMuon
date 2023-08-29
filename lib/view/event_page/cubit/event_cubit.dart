import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constant/constants.dart';
import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/project_list_repository.dart';
import '../../../data/repository/remote/repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_type/event_type.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../domain/entity/event/user_event_joined.dart/user_event_joined.dart';
import '../../../domain/entity/project/project.dart';
import '../../../shared/utils/geocoding_helper.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _eventRepository = getIt.get<EventRepository>();

  EventCubit() : super(EventInitial());

  late final EventFilterData eventFilterData = EventFilterData();
  late Event currentSelectedEvent;

  final List<Event> events = [];

  getCurrentLocation() async {
    final geocodingHelper = getIt<GeocodingHelper>();
    final CurrentLocation currentLocation =
        await geocodingHelper.getCurrentLocation();
    if (currentLocation.long == 0 && currentLocation.lat == 0) {
      emit(EventCurrentLocationDeniedForeverState());
    } else {
      emit(EventHasPermissionState(
          hasPermission: true, currentLocation: currentLocation));
    }
  }

  openAppSetting() async {
    final geocodingHelper = getIt<GeocodingHelper>();
    final hasPermision = await geocodingHelper.openAppSetting();
    CurrentLocation? currentLocation;
    if (hasPermision) {
      currentLocation = await geocodingHelper.getCurrentLocation();
    }
    emit(EventHasPermissionState(
      hasPermission: hasPermision,
      currentLocation: currentLocation,
    ));
  }

  getAllEvent({
    String? keyword,
    String? date,
    String? startDate,
    String? endDate,
    bool? isOpening,
  }) async {
    emit(EventInitial());
    eventFilterData.status = null;
    eventFilterData.statusFilterData.asMap().entries.map((e) {
      if (e.value) {
        eventFilterData.status = e.key == 0
            ? EventStatus.begining
            : e.key == 1
                ? EventStatus.finished
                : e.key == 2
                    ? EventStatus.notStarted
                    : null;
      }
    }).toList();
    final response = await _eventRepository.getAllEvent(
      keyword: eventFilterData.keyword,
      status: eventFilterData.status,
      date: date,
      isOpening: isOpening,
      isDescending: eventFilterData.timeFilterData[0]
          ? false
          : eventFilterData.timeFilterData[1]
              ? true
              : null,
      startDate: eventFilterData.timeFilterData[2]
          ? eventFilterData.timeRange[0]
          : null,
      endDate: eventFilterData.timeFilterData[2]
          ? eventFilterData.timeRange[1]
          : null,
    );
    if (response.status == ResponseStatus.success) {
      events.clear();
      events.addAll(response.data ?? []);
      emit(EventGetAllEventSuccessState(events));
    } else {
      emit(EventGetAllEventFailedState());
    }
  }

  getAllCalendarEvent({
    String? startDate,
    String? endDate,
  }) async {
    final response = await _eventRepository.getAllCalendarEvent(
      startDate: startDate,
      endDate: endDate,
    );
    if (response.status == ResponseStatus.success) {
      if (startDate != null && endDate != null) {
        emit(EventGetAllEventRangeSuccessState(response.data ?? []));
      } else {
        emit(EventGetAllEventSuccessState(
          response.data ?? [],
        ));
      }
    } else {
      emit(EventGetAllEventFailedState());
    }
  }

  getAllCheckedInMember(String eventId) async {
    final response =
        await _eventRepository.getAllCheckedInMember(eventId: eventId);
    if (response.status == ResponseStatus.success) {
      await Future.delayed(const Duration(milliseconds: 200));
      emit(EventGetAllMemberSuccessState(response.data ?? []));
    } else {
      emit(EventGetAllMemberFailedState());
    }
  }

  getAllHistory({String? username}) async {
    final response = await _eventRepository.getAllHistory(username: username);

    if (response.status == ResponseStatus.success) {
      emit(EventGetAllHistorySuccessState(response.data ?? []));
    } else {
      emit(EventGetAllMemberFailedState());
    }
  }

  getEventById(String eventId) async {
    emit(EventResetState());
    final response = await _eventRepository.getEventById(eventId);

    if (response.status == ResponseStatus.success) {
      currentSelectedEvent = response.data!;
      emit(EventGetEventByIdSuccessState(response.data!));
    } else {
      emit(EventGetEventByIdFailedState());
    }
  }

  rebuildEventDetail(Event event) {
    emit(EventGetEventByIdSuccessState(event));
    events[events.indexOf(
        events.where((element) => element.id == event.id).first)] = event;
    emit(EventGetAllEventSuccessState(events));
  }

  addEvent(Event event) async {
    final response = await _eventRepository.createEvent(event);

    if (response.status == ResponseStatus.success) {
      emit(EventAddEventSuccessState(event));
    } else {
      emit(EventAddEventFailedState());
    }
  }

  updateEvent(Event event) async {
    final response = await _eventRepository.updateEvent(event);
    if (response.status == ResponseStatus.success) {
      currentSelectedEvent = response.data!;
      emit(EventUpdateEventSuccessState(currentSelectedEvent));
    } else {
      emit(EventUpdateEventFailedState());
    }
  }

  deleteEvent(String eventId) async {
    final response = await _eventRepository.deleteEvent(eventId);

    if (response.status == ResponseStatus.success) {
      events.removeWhere(
        (element) => element.id == eventId,
      );
      emit(EventDeleteEventSuccessState());
      emit(EventGetAllEventSuccessState(events));
    } else {
      emit(EventDeleteEventFailedState());
    }
  }

  showFullDay(bool isShow) {
    emit(EventShowFullDayState(isShow));
  }

  joinEvent(String eventId, String? username, String? location,
      {bool isUserScan = false}) async {
    final response = await _eventRepository.joinEvent(
        eventId: eventId, username: username, location: location);

    if (response.status == ResponseStatus.success) {
      emit(EventJoinEventSuccessState(response.data ?? UserEventJoined(),
          isUserScan: isUserScan));
    } else {
      emit(EventJoinEventFailedState());
    }
  }

  onCheckRangeDateTime(String startTime, String endTime) async {
    final check = startTime.compareTo(endTime);
    await Future.delayed(const Duration(milliseconds: 100));
    emit(EventCheckedRangeDateTimeState(
      isSastified: check <= 0,
      startTime: startTime,
      endTime: endTime,
    ));
  }

  onFilterChange() {
    int filterCount = 0;
    for (var element in eventFilterData.statusFilterData) {
      if (element) filterCount++;
    }
    for (var element in eventFilterData.timeFilterData) {
      if (element) filterCount++;
    }
    emit(EventFilterChangeState(filterCount));
  }

  showSearchBar(double offset) {
    bool isShow = true;
    if (offset <= 0) {
      isShow = true;
    } else {
      isShow = false;
    }
    emit(EventShowSearchBarState(isShow));
  }
}

class EventFilterData {
  String? keyword;
  bool? isDescending;
  int? status;
  final List<bool> statusFilterData = <bool>[false, false, false];
  final List<bool> timeFilterData = <bool>[false, false, false];
  final List<String> timeRange = <String>[
    DateTime.now().toIso8601String().toString(),
    DateTime.now().toIso8601String().toString()
  ];
}
