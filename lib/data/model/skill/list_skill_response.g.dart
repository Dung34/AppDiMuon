// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSkillResponseImpl _$$ListSkillResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListSkillResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListSkillResponseImplToJson(
        _$ListSkillResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
