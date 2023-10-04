// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListTarget _$$_ListTargetFromJson(Map<String, dynamic> json) =>
    _$_ListTarget(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListTargetToJson(_$_ListTarget instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
