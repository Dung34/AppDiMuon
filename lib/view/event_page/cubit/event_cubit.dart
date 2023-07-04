import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/api/base_response.dart';
import '../../../data/repository/remote/repository.dart';
import '../../../di/di.dart';
import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_type/event_type.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _eventRepository = getIt.get<EventRepository>();

  EventCubit() : super(EventInitial());

  getAllEvent({int type = 0, String? date}) async {
    emit(EventInitial());
    final response = await _eventRepository.getAllEvent(type: type);
    if (response.status == ResponseStatus.success) {
      log('get all${response.data ?? []}');
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
}
