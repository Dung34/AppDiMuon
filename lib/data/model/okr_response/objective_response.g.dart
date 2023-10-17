// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObjectiveResponseImpl _$$ObjectiveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ObjectiveResponseImpl(
      objectiveId: json['objectiveId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      okrId: json['okrId'] as String?,
      relatedObjective: (json['relatedObjective'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitId: json['unitId'] as String?,
      unitName: json['unitName'] as String?,
      process: (json['process'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ObjectiveResponseImplToJson(
        _$ObjectiveResponseImpl instance) =>
    <String, dynamic>{
      'objectiveId': instance.objectiveId,
      'title': instance.title,
      'description': instance.description,
      'okrId': instance.okrId,
      'relatedObjective': instance.relatedObjective,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'process': instance.process,
    };
