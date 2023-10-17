// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillImpl _$$SkillImplFromJson(Map<String, dynamic> json) => _$SkillImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      point: json['point'] as int?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$SkillImplToJson(_$SkillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'point': instance.point,
      'description': instance.description,
      'icon': instance.icon,
      'userId': instance.userId,
    };
