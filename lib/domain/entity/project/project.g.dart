// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      name: json['name'] as String?,
      status: json['status'] as int?,
      projectMembers: (json['projectMembers'] as List<dynamic>?)
          ?.map((e) => ProjectMembers.fromJson(e as Map<String, dynamic>))
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

_$_ProjectMembers _$$_ProjectMembersFromJson(Map<String, dynamic> json) =>
    _$_ProjectMembers(
      projectId: json['projectId'] as String?,
      userId: json['userId'] as String?,
      role: json['role'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ProjectMembersToJson(_$_ProjectMembers instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'userId': instance.userId,
      'role': instance.role,
      'id': instance.id,
    };
