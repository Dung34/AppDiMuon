// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListTargetImpl _$$ListTargetImplFromJson(Map<String, dynamic> json) =>
    _$ListTargetImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListTargetImplToJson(_$ListTargetImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
