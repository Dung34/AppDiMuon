// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectResponse _$$_ProjectResponseFromJson(Map<String, dynamic> json) =>
    _$_ProjectResponse(
      name: json['name'] as String?,
      status: json['status'] as int?,
      projectMembers: (json['projectMembers'] as List<dynamic>?)
          ?.map((e) => ProjectMembers.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$_ProjectResponseToJson(_$_ProjectResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'projectMembers': instance.projectMembers,
      'tasks': instance.tasks,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };
