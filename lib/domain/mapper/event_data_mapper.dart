import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/event_response/checkin_response.dart';
import '../../data/model/event_response/event_member_response.dart';
import '../../data/model/event_response/event_response.dart';
import '../entity/event/checkin_statistic/checkin_statistic.dart';
import '../entity/event/event_member/event_member.dart';
import '../entity/event/event_wrapper/event.dart';

class EventDataMapper extends BaseDataMapper<EventResponse, Event>
    with DataMapperMixin {
  @override
  Event mapToEntity(EventResponse? data) {
    return Event(
      title: data?.title,
      image: data?.image,
      background: data?.background,
      description: data?.description,
      startDate: data?.startDate,
      status: data?.status,
      isJoin: data?.isJoin,
      endDate: data?.endDate,
      quantity: data?.quantity,
      type: data?.type,
      location: data?.location,
      scanner: data?.scanner,
      id: data?.id,
      createdBy: data?.createdBy,
      createdDate: data?.createdDate,
      lastModifiedBy: data?.lastModifiedBy,
      lastModifiedDate: data?.lastModifiedDate,
    );
  }

  @override
  EventResponse mapToData(Event entity) {
    return EventResponse(
      title: entity.title,
      image: entity.image,
      background: entity.background,
      description: entity.description,
      startDate: entity.startDate,
      status: entity.status,
      isJoin: entity.isJoin,
      endDate: entity.endDate,
      quantity: entity.quantity,
      type: entity.type,
      location: entity.location,
      scanner: entity.scanner,
      id: entity.id,
      createdBy: entity.createdBy,
      createdDate: entity.createdDate,
      lastModifiedBy: entity.lastModifiedBy,
      lastModifiedDate: entity.lastModifiedDate,
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
      checkedInDate: data?.checkedInDate,
      checkedInLocation: data?.checkedInLocation == null ||
              (data?.checkedInLocation ?? '').isEmpty
          ? 'Chưa cập nhật'
          : data?.checkedInLocation,
      avatar: data?.avatar,
    );
  }
}

class CheckinDataMapper
    extends BaseDataMapper<CheckinResponse, CheckinStatistic> {
  @override
  CheckinStatistic mapToEntity(CheckinResponse? data) {
    return CheckinStatistic(
      data?.dateNow,
      data?.workDay,
      data?.lateDay,
      data?.leaveDay,
      data?.listEventCheckin,
    );
  }
}
