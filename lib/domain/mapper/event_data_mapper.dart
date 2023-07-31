import '../../data/constant/constants.dart';
import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/event_response/event_member_response.dart';
import '../../data/model/event_response/event_response.dart';
import '../entity/event/event_member/event_member.dart';
import '../entity/event/event_wrapper/event.dart';

class EventDataMapper extends BaseDataMapper<EventResponse, Event>
    with DataMapperMixin {
  @override
  Event mapToEntity(EventResponse? data) {
    return Event(
      id: data?.id ?? '',
      title: data?.title,
      description: data?.description,
      location: data?.location == null || (data?.location! ?? '').isEmpty
          ? 'Chưa cập nhật'
          : data?.location!,
      status: data?.status ?? 1,
      statusStr: statusToString(data?.status ?? 1),
      background: data?.background,
      checked: data?.checked ?? false,
      startTime: data?.startDate.toString(),
      endTime: data?.endDate.toString(),
      totalUserCount: data?.quantity ?? 0,
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
        return 'ERROR';
    }
  }

  @override
  EventResponse mapToData(Event entity) {
    return EventResponse(
      id: entity.id,
      background: entity.background,
      description: entity.description,
      status: entity.status,
      endDate: entity.endTime,
      startDate: entity.startTime,
      location: entity.location,
      title: entity.title,
    );
  }
}

class EventMemberDataMapper
    extends BaseDataMapper<EventMemberResponse, EventMember> {
  @override
  EventMember mapToEntity(EventMemberResponse? data) {
    return EventMember(
      id: data?.id,
      userId: data?.userId ?? '',
      eventId: data?.eventId ?? '',
      eventTitle: data?.eventTitle,
      fullname: data?.fullname,
      checkedInDate: data?.createdDate,
      checkedInLocation: data?.checkedInLocation == null ||
              (data?.checkedInLocation! ?? '').isEmpty
          ? 'Chưa cập nhật'
          : data?.checkedInLocation!,
      avatar: data?.avatar,
    );
  }
}
