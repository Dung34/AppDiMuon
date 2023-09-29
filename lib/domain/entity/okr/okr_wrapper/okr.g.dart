// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'okr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OKR _$$_OKRFromJson(Map<String, dynamic> json) => _$_OKR(
      name: json['name'] as String?,
      description: json['description'] as String?,
      unitId: json['unitId'] as String?,
      progress: json['progress'] as String?,
      totalObjective: json['totalObjective'] as int?,
      totalKR: json['totalKR'] as int?,
      totalTask: json['totalTask'] as int?,
    );

Map<String, dynamic> _$$_OKRToJson(_$_OKR instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'unitId': instance.unitId,
      'progress': instance.progress,
      'totalObjective': instance.totalObjective,
      'totalKR': instance.totalKR,
      'totalTask': instance.totalTask,
    };
