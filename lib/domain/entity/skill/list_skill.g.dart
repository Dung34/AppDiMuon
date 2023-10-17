// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSkillImpl _$$ListSkillImplFromJson(Map<String, dynamic> json) =>
    _$ListSkillImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$$ListSkillImplToJson(_$ListSkillImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
