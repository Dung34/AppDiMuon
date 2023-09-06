import '../../../domain/entity/event/event_wrapper/event.dart';
import '../../model/api/base_response.dart';

abstract class EventRepository {
  Future<ResponseWrapper<List<Event>>> getAllEvent({
    String? description,
    String? endDate,
    List<String>? image,
    int? isJoin,
    String? location,
    int? quantity,
    int? scanner,
    String? startDate,
    int? status,
    String? title,
  });

  Future<ResponseWrapper<Event>> getEventById(String eventId);
}
