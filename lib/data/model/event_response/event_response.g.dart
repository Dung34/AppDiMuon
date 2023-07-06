// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventResponse _$$_EventResponseFromJson(Map<String, dynamic> json) =>
    _$_EventResponse(
      title: json['title'] as String?,
      background: json['background'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as int?,
      quantity: json['quantity'] as int?,
      id: json['id'] as String?,
      createdDate: json['createdDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
    );

Map<String, dynamic> _$$_EventResponseToJson(_$_EventResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'background': instance.background,
      'location': instance.location,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'quantity': instance.quantity,
      'id': instance.id,
      'createdDate': instance.createdDate,
      'lastModifiedDate': instance.lastModifiedDate,
    };
