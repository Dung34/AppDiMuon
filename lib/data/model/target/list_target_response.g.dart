// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_target_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListTargetResponse _$$_ListTargetResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListTargetResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListTargetResponseToJson(
        _$_ListTargetResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
