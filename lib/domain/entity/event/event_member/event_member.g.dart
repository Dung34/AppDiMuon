// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventMemberImpl _$$EventMemberImplFromJson(Map<String, dynamic> json) =>
    _$EventMemberImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String? ?? '',
      eventId: json['eventId'] as String?,
      fullname: json['fullname'] as String?,
      avatar: json['avatar'] as String?,
      eventTitle: json['eventTitle'] as String?,
      checkedInLocation: json['checkedInLocation'] as String?,
      checkedInDate: json['checkedInDate'] as String?,
    );

Map<String, dynamic> _$$EventMemberImplToJson(_$EventMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'eventId': instance.eventId,
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'eventTitle': instance.eventTitle,
      'checkedInLocation': instance.checkedInLocation,
      'checkedInDate': instance.checkedInDate,
    };
