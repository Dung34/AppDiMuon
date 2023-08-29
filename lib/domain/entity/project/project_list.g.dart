// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectList _$$_ProjectListFromJson(Map<String, dynamic> json) =>
    _$_ProjectList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ProjectListToJson(_$_ProjectList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
