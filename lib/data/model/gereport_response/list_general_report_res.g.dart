// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_general_report_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListGeneralReportRes _$$_ListGeneralReportResFromJson(
        Map<String, dynamic> json) =>
    _$_ListGeneralReportRes(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GeneralReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListGeneralReportResToJson(
        _$_ListGeneralReportRes instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
