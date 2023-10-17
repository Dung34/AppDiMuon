// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      taskName: json['taskName'] as String?,
      dueDate: json['dueDate'] as String?,
      completeDate: json['completeDate'] as String?,
      projectId: json['projectId'] as String?,
      taskMembers: (json['taskMembers'] as List<dynamic>?)
          ?.map((e) => TaskMembers.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'taskName': instance.taskName,
      'dueDate': instance.dueDate,
      'completeDate': instance.completeDate,
      'projectId': instance.projectId,
      'taskMembers': instance.taskMembers,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$TaskMembersImpl _$$TaskMembersImplFromJson(Map<String, dynamic> json) =>
    _$TaskMembersImpl(
      taskId: json['taskId'] as String?,
      userId: json['userId'] as String?,
      role: json['role'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$TaskMembersImplToJson(_$TaskMembersImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'userId': instance.userId,
      'role': instance.role,
      'id': instance.id,
    };
