import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_type/event_type.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../shared/utils/geocoding_helper.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _eventRepository = getIt.get<EventRepository>();

  EventCubit() : super(EventInitial());

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

  getAllEvent({int type = 0, String? date, bool? isOpening}) async {
    emit(EventInitial());
    final response = await _eventRepository.getAllEvent(
      type: type,
      date: date,
      isOpening: isOpening,
    );
    if (response.status == ResponseStatus.success) {
      emit(EventGetAllEventSuccessState(response.data ?? []));
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

  getAllHistory() async {
    final response = await _eventRepository.getAllHistory();

    if (response.status == ResponseStatus.success) {
      emit(EventGetAllHistorySuccessState(response.data ?? []));
    } else {
      emit(EventGetAllMemberFailedState());
    }
  }

  addEvent(Event event) async {
    final response = await _eventRepository.createEvent(event);

    if (response.status == ResponseStatus.success) {
      emit(EventAddEventSuccessState(event));
    } else {
      emit(EventAddEventFailedState());
    }
  }

  showFullDay(bool isShow) {
    emit(EventShowFullDayState(isShow));
  }

  onCheckRangeDateTime(String startTime, String endTime) {
    final check = startTime.compareTo(endTime);
    emit(EventCheckedRangeDateTimeState(
      isSastified: check <= 0,
      startTime: startTime,
      endTime: endTime,
    ));
  }
}
