// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ObjectiveResponse _$$_ObjectiveResponseFromJson(Map<String, dynamic> json) =>
    _$_ObjectiveResponse(
      id: json['id'] as String?,
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

Map<String, dynamic> _$$_ObjectiveResponseToJson(
        _$_ObjectiveResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'okrId': instance.okrId,
      'relatedObjective': instance.relatedObjective,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'process': instance.process,
    };
