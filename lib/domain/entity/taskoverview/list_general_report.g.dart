// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_general_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListGeneralReport _$$_ListGeneralReportFromJson(Map<String, dynamic> json) =>
    _$_ListGeneralReport(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GeneralReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListGeneralReportToJson(
        _$_ListGeneralReport instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
