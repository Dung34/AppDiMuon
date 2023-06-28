// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      type: json['type'] as String?,
      background: json['background'] as String?,
      concerned: json['concerned'] as bool?,
      userId: json['userId'] as String?,
      userFullname: json['userFullname'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      description: json['description'] as String?,
      concernedUser: (json['concernedUser'] as List<dynamic>?)
          ?.map((e) => ConcernedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'background': instance.background,
      'concerned': instance.concerned,
      'userId': instance.userId,
      'userFullname': instance.userFullname,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
      'concernedUser': instance.concernedUser,
    };
