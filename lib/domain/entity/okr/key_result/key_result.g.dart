// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeyResultImpl _$$KeyResultImplFromJson(Map<String, dynamic> json) =>
    _$KeyResultImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      key: json['key'] as String?,
      result: json['result'] as String?,
      status: json['status'] as int?,
      target: (json['target'] as num?)?.toDouble(),
      actual: (json['actual'] as num?)?.toDouble(),
      objectiveId: json['objectiveId'] as String?,
      okRsId: json['okRsId'] as String?,
      dueDate: json['dueDate'] as String?,
      totalTask: json['totalTask'] as int?,
      doneTask: json['doneTask'] as int?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$KeyResultImplToJson(_$KeyResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'key': instance.key,
      'result': instance.result,
      'status': instance.status,
      'target': instance.target,
      'actual': instance.actual,
      'objectiveId': instance.objectiveId,
      'okRsId': instance.okRsId,
      'dueDate': instance.dueDate,
      'totalTask': instance.totalTask,
      'doneTask': instance.doneTask,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };
