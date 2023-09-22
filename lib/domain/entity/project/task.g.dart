// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
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

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'taskName': instance.taskName,
      'dueDate': instance.dueDate,
      'completeDate': instance.completeDate,
      'projectId': instance.projectId,
      'taskMembers': instance.taskMembers,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$_TaskMembers _$$_TaskMembersFromJson(Map<String, dynamic> json) =>
    _$_TaskMembers(
      taskId: json['taskId'] as String?,
      userId: json['userId'] as String?,
      role: json['role'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_TaskMembersToJson(_$_TaskMembers instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'userId': instance.userId,
      'role': instance.role,
      'id': instance.id,
    };
