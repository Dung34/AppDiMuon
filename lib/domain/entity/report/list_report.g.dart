// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListReport _$$_ListReportFromJson(Map<String, dynamic> json) =>
    _$_ListReport(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDaily.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalcount: json['totalcount'] as int?,
    );

Map<String, dynamic> _$$_ListReportToJson(_$_ListReport instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalcount': instance.totalcount,
    };
