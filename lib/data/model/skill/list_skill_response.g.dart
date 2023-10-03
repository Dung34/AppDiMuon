// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListSkillResponse _$$_ListSkillResponseFromJson(Map<String, dynamic> json) =>
    _$_ListSkillResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListSkillResponseToJson(
        _$_ListSkillResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
