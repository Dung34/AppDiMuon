// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObjectiveImpl _$$ObjectiveImplFromJson(Map<String, dynamic> json) =>
    _$ObjectiveImpl(
      objectiveId: json['objectiveId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      okrId: json['okrId'] as String?,
      relatedObjective: (json['relatedObjective'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitId: json['unitId'] as String?,
      unitName: json['unitName'] as String?,
    );

Map<String, dynamic> _$$ObjectiveImplToJson(_$ObjectiveImpl instance) =>
    <String, dynamic>{
      'objectiveId': instance.objectiveId,
      'title': instance.title,
      'description': instance.description,
      'okrId': instance.okrId,
      'relatedObjective': instance.relatedObjective,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
    };
