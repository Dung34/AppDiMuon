import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    String? taskName,
    String? dueDate,
    String? completeDate,
    String? projectId,
    List<TaskMembers>? taskMembers,
    String? id,
    String? createdBy,
    String? createdDate,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class TaskMembers with _$TaskMembers {
  factory TaskMembers({
    String? taskId,
    String? userId,
    int? role,
    String? id,
  }) = _TaskMembers;

  factory TaskMembers.fromJson(Map<String, dynamic> json) =>
      _$TaskMembersFromJson(json);
}
