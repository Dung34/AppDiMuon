// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_general_report_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListGeneralReportResImpl _$$ListGeneralReportResImplFromJson(
        Map<String, dynamic> json) =>
    _$ListGeneralReportResImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GeneralReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListGeneralReportResImplToJson(
        _$ListGeneralReportResImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
