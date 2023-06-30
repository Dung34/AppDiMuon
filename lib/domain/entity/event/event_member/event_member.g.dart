// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventMember _$$_EventMemberFromJson(Map<String, dynamic> json) =>
    _$_EventMember(
      id: json['id'] as String?,
      userId: json['userId'] as String? ?? '',
      fullname: json['fullname'] as String?,
      avatar: json['avatar'] as String?,
      checkedInLocation: json['checkedInLocation'] as String?,
      checkedInDate: json['checkedInDate'] as String?,
    );

Map<String, dynamic> _$$_EventMemberToJson(_$_EventMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'checkedInLocation': instance.checkedInLocation,
      'checkedInDate': instance.checkedInDate,
    };
