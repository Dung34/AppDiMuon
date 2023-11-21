// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OKRImpl _$$OKRImplFromJson(Map<String, dynamic> json) => _$OKRImpl(
      id: json['id'] as String?,
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

Map<String, dynamic> _$$OKRImplToJson(_$OKRImpl instance) => <String, dynamic>{
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
