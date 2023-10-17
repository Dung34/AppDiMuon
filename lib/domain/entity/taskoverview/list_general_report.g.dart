// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_general_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListGeneralReportImpl _$$ListGeneralReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ListGeneralReportImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GeneralReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListGeneralReportImplToJson(
        _$ListGeneralReportImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
