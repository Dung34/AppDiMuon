// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListSkill _$$_ListSkillFromJson(Map<String, dynamic> json) => _$_ListSkill(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$_ListSkillToJson(_$_ListSkill instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
