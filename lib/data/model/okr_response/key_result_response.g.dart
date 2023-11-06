// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeyResultResponseImpl _$$KeyResultResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$KeyResultResponseImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      objectiveId: json['objectiveId'] as String?,
      key: json['key'] as String?,
      result: json['result'] as String?,
      target: (json['target'] as num?)?.toDouble(),
      actual: (json['actual'] as num?)?.toDouble(),
      okRsId: json['okRsId'] as String?,
      status: json['status'] as int?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$KeyResultResponseImplToJson(
        _$KeyResultResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'objectiveId': instance.objectiveId,
      'key': instance.key,
      'result': instance.result,
      'target': instance.target,
      'actual': instance.actual,
      'okRsId': instance.okRsId,
      'status': instance.status,
      'createdBy': instance.createdBy,
    };
