// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OKR _$$_OKRFromJson(Map<String, dynamic> json) => _$_OKR(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      unitId: json['unitId'] as String?,
      process: json['process'] as String?,
      totalObjective: json['totalObjective'] as int?,
      totalKR: json['totalKR'] as int?,
      totalTask: json['totalTask'] as int?,
      objectives: (json['objectives'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OKRToJson(_$_OKR instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unitId': instance.unitId,
      'process': instance.process,
      'totalObjective': instance.totalObjective,
      'totalKR': instance.totalKR,
      'totalTask': instance.totalTask,
      'objectives': instance.objectives,
    };
