// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      type: json['type'] as String?,
      background: json['background'] as String?,
      checked: json['checked'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      statusStr: json['statusStr'] as String? ?? '',
      totalUserCount: json['totalUserCount'] as int? ?? 0,
      userId: json['userId'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'background': instance.background,
      'checked': instance.checked,
      'status': instance.status,
      'statusStr': instance.statusStr,
      'totalUserCount': instance.totalUserCount,
      'userId': instance.userId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
    };
