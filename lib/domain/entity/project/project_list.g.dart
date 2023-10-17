// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectListImpl _$$ProjectListImplFromJson(Map<String, dynamic> json) =>
    _$ProjectListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ProjectListImplToJson(_$ProjectListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
