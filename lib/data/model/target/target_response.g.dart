// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetResponse _$$_TargetResponseFromJson(Map<String, dynamic> json) =>
    _$_TargetResponse(
      title: json['title'] as String?,
      description: json['description'] as String?,
      target: json['target'] as int?,
      actual: json['actual'] as int?,
      type: json['type'] as int?,
      status: json['status'] as int?,
      userId: json['userId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_TargetResponseToJson(_$_TargetResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'target': instance.target,
      'actual': instance.actual,
      'type': instance.type,
      'status': instance.status,
      'userId': instance.userId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'id': instance.id,
    };