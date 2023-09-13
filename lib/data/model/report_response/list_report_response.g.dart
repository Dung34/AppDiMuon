// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListReportResponse _$$_ListReportResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListReportResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDaily.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalcount: json['totalcount'] as int?,
    );

Map<String, dynamic> _$$_ListReportResponseToJson(
        _$_ListReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalcount': instance.totalcount,
    };
