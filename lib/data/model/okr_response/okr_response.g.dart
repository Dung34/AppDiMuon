// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OKRResponse _$$_OKRResponseFromJson(Map<String, dynamic> json) =>
    _$_OKRResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      unitId: json['unitId'] as String?,
      process: (json['process'] as num?)?.toDouble(),
      totalObjective: json['totalObjective'] as int?,
      totalKR: json['totalKR'] as int?,
      totalTask: json['totalTask'] as int?,
      objectives: (json['objectives'] as List<dynamic>?)
          ?.map((e) => Objective.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OKRResponseToJson(_$_OKRResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'unitId': instance.unitId,
      'process': instance.process,
      'totalObjective': instance.totalObjective,
      'totalKR': instance.totalKR,
      'totalTask': instance.totalTask,
      'objectives': instance.objectives,
    };
