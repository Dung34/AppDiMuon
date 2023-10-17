// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TargetResponseImpl _$$TargetResponseImplFromJson(Map<String, dynamic> json) =>
    _$TargetResponseImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      targe: (json['targe'] as num?)?.toDouble(),
      actual: (json['actual'] as num?)?.toDouble(),
      type: json['type'] as int?,
      status: json['status'] as int?,
      userId: json['userId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$TargetResponseImplToJson(
        _$TargetResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'targe': instance.targe,
      'actual': instance.actual,
      'type': instance.type,
      'status': instance.status,
      'userId': instance.userId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'id': instance.id,
    };
