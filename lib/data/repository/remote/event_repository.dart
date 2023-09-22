import '../../../domain/entity/event/checkin_statistic/checkin_statistic.dart';
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

  Future<ResponseWrapper<List<Event>>> getAllCalendarEvent({
    String? startDate,
    String? endDate,
  });

  Future<ResponseWrapper<int>> onCheckinSetting(String timeWorkFrom,
      String timeWorkTo, String dateApplyFrom, String dateApplyTo);

  Future<ResponseWrapper<CheckinStatistic>> getCheckinStatistic(String? userId);

  Future<ResponseWrapper<List<Event>>> getEventByDate(String date);

  Future<ResponseWrapper<Event>> getEventById(String eventId);

  Future<ResponseWrapper<List<Event>>> getEventByFilter(int status, int isJoin);

  Future<ResponseWrapper<String>> getQRCode(String eventId, String type);

  Future<ResponseWrapper<int>> joinInEvent(String id);
}
