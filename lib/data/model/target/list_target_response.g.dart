// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_target_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListTargetResponseImpl _$$ListTargetResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListTargetResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListTargetResponseImplToJson(
        _$ListTargetResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
