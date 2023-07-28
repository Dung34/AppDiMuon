import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../../domain/entity/event/user_event_joined.dart/user_event_joined.dart';
import '../../model/api/base_response.dart';

abstract class EventRepository {
  Future<ResponseWrapper<List<Event>>> getAllEvent({
    String? keyword,
    int? status,
    String? date,
    String? startDate,
    String? endDate,
    bool? isOpening,
    bool? isDescending,
  });

  Future<ResponseWrapper<Event>> getEventById(String eventId);

  Future<ResponseWrapper<Event>> createEvent(Event event);

  Future<ResponseWrapper<List<EventMember>>> getAllCheckedInMember(
      {required String eventId});

  Future<ResponseWrapper<List<EventMember>>> getAllHistory({String? userId});

  Future<ResponseWrapper<UserEventJoined>> joinEvent({
    String? userId,
    String? eventId,
    String? location,
  });
}
