// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TargetImpl _$$TargetImplFromJson(Map<String, dynamic> json) => _$TargetImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      target: (json['target'] as num?)?.toDouble(),
      actual: (json['actual'] as num?)?.toDouble(),
      type: json['type'] as int?,
      status: json['status'] as int?,
      userId: json['userId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$TargetImplToJson(_$TargetImpl instance) =>
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
