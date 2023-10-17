// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListReportResponseImpl _$$ListReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListReportResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDaily.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalcount: json['totalcount'] as int?,
    );

Map<String, dynamic> _$$ListReportResponseImplToJson(
        _$ListReportResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalcount': instance.totalcount,
    };
