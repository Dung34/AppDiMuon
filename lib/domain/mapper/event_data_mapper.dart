import '../../data/constant/constants.dart';
import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/event_response/event_response.dart';
import '../entity/event/event_wrapper/event.dart';

class EventDataMapper extends BaseDataMapper<EventResponse, Event>
    with DataMapperMixin {
  @override
  Event mapToEntity(EventResponse? data) {
    return Event(
      id: data?.id ?? '',
      title: data?.title,
      description: data?.description,
      location: data?.location,
      status: data?.status ?? 0,
      statusStr: statusToString(data?.status ?? 0),
      background: data?.background,
      checked: true,
      startTime: data?.startDate.toString(),
      endTime: data?.endDate.toString(),
      totalUserCount: 210,
    );
  }

  String statusToString(int status) {
    switch (status) {
      case EventStatus.notStarted:
        return EventStatusStr.notStarted;
      case EventStatus.begining:
        return EventStatusStr.begining;
      case EventStatus.finished:
        return EventStatusStr.finished;
      case EventStatus.canceled:
        return EventStatusStr.canceled;
      default:
        return EventStatusStr.canceled;
    }
  }

  @override
  EventResponse mapToData(Event entity) {
    return EventResponse(
      id: entity.id,
      background: entity.background,
      description: entity.description,
      endDate: entity.endTime,
      startDate: entity.startTime,
      location: entity.location,
      title: entity.title,
    );
  }
}
