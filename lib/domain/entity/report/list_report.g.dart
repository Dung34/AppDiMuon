// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListReportImpl _$$ListReportImplFromJson(Map<String, dynamic> json) =>
    _$ListReportImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDaily.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalcount: json['totalcount'] as int?,
    );

Map<String, dynamic> _$$ListReportImplToJson(_$ListReportImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalcount': instance.totalcount,
    };
