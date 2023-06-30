import '../../../domain/entity/event/event_member/event_member.dart';
import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../model/api/base_response.dart';

abstract class EventRepository {
  Future<ResponseWrapper<List<Event>>> getAllEvent({int type = 0});
  Future<ResponseWrapper<List<EventMember>>> getAllCheckedInMember(
      {required String eventId});
}
