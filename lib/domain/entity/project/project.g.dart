// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
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

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'projectMembers': instance.projectMembers,
      'tasks': instance.tasks,
      'id': instance.id,
    };

_$_ProjectMember _$$_ProjectMemberFromJson(Map<String, dynamic> json) =>
    _$_ProjectMember(
      userId: json['userId'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$$_ProjectMemberToJson(_$_ProjectMember instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
    };
