// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Objective _$$_ObjectiveFromJson(Map<String, dynamic> json) => _$_Objective(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      okrId: json['okrId'] as String?,
      relatedObjective: (json['relatedObjective'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitId: json['unitId'] as String?,
      unitName: json['unitName'] as String?,
      progress: (json['progress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ObjectiveToJson(_$_Objective instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'okrId': instance.okrId,
      'relatedObjective': instance.relatedObjective,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'progress': instance.progress,
    };
