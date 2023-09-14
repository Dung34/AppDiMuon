// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckinStatistic _$$_CheckinStatisticFromJson(Map<String, dynamic> json) =>
    _$_CheckinStatistic(
      json['dateNow'] as String?,
      json['workDay'] as int?,
      json['lateDay'] as int?,
      json['leaveDay'] as int?,
      (json['listEventCheckin'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_CheckinStatisticToJson(_$_CheckinStatistic instance) =>
    <String, dynamic>{
      'dateNow': instance.dateNow,
      'workDay': instance.workDay,
      'lateDay': instance.lateDay,
      'leaveDay': instance.leaveDay,
      'listEventCheckin': instance.listEventCheckin,
    };
