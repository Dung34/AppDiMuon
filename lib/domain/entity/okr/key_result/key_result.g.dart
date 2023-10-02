// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeyResult _$$_KeyResultFromJson(Map<String, dynamic> json) => _$_KeyResult(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      target: (json['target'] as num?)?.toDouble(),
      actual: (json['actual'] as num?)?.toDouble(),
      objectiveId: json['objectiveId'] as String?,
    );

Map<String, dynamic> _$$_KeyResultToJson(_$_KeyResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'target': instance.target,
      'actual': instance.actual,
      'objectiveId': instance.objectiveId,
    };
