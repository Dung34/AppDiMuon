// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventWrapper _$$_EventWrapperFromJson(Map<String, dynamic> json) =>
    _$_EventWrapper(
      id: json['id'] as String?,
      title: json['title'] as String?,
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_EventWrapperToJson(_$_EventWrapper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'events': instance.events,
    };
