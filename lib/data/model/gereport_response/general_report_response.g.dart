// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralReportResponseImpl _$$GeneralReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralReportResponseImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTo: json['dateTo'] as String?,
      dateFrom: json['dateFrom'] as String?,
      workDone: json['workDone'] as String?,
      issue: json['issue'] as String?,
      add: json['add'] as String?,
    );

Map<String, dynamic> _$$GeneralReportResponseImplToJson(
        _$GeneralReportResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dateTo': instance.dateTo,
      'dateFrom': instance.dateFrom,
      'workDone': instance.workDone,
      'issue': instance.issue,
      'add': instance.add,
    };
