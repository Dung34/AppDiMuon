// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckinStatisticImpl _$$CheckinStatisticImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckinStatisticImpl(
      json['dateNow'] as String?,
      json['workDay'] as int?,
      json['lateDay'] as int?,
      json['leaveDay'] as int?,
      (json['listEventCheckin'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CheckinStatisticImplToJson(
        _$CheckinStatisticImpl instance) =>
    <String, dynamic>{
      'dateNow': instance.dateNow,
      'workDay': instance.workDay,
      'lateDay': instance.lateDay,
      'leaveDay': instance.leaveDay,
      'listEventCheckin': instance.listEventCheckin,
    };
