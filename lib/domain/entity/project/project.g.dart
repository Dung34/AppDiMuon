// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      name: json['name'] as String?,
      status: json['status'] as int?,
      projectMembers: (json['projectMembers'] as List<dynamic>?)
          ?.map((e) => ProjectMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'projectMembers': instance.projectMembers,
      'tasks': instance.tasks,
      'id': instance.id,
    };

_$ProjectMemberImpl _$$ProjectMemberImplFromJson(Map<String, dynamic> json) =>
    _$ProjectMemberImpl(
      userId: json['userId'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$$ProjectMemberImplToJson(_$ProjectMemberImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
    };
