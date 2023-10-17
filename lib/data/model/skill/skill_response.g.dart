// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillResponseImpl _$$SkillResponseImplFromJson(Map<String, dynamic> json) =>
    _$SkillResponseImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      point: json['point'] as int?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$SkillResponseImplToJson(_$SkillResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'point': instance.point,
      'description': instance.description,
      'icon': instance.icon,
      'userId': instance.userId,
    };
