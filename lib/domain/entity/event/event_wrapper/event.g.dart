// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      title: json['title'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      background: json['background'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] as String?,
      status: json['status'] as int?,
      isJoin: json['isJoin'] as int?,
      endDate: json['endDate'] as String?,
      quantity: json['quantity'] as int?,
      type: json['type'] as int?,
      location: json['location'] as String?,
      scanner: json['scanner'] as int?,
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'background': instance.background,
      'description': instance.description,
      'startDate': instance.startDate,
      'status': instance.status,
      'isJoin': instance.isJoin,
      'endDate': instance.endDate,
      'quantity': instance.quantity,
      'type': instance.type,
      'location': instance.location,
      'scanner': instance.scanner,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDate': instance.lastModifiedDate,
    };
