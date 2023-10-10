import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user/user_response/user_response.dart';

part 'task_response.freezed.dart';
part 'task_response.g.dart';

@freezed
class TaskResponse with _$TaskResponse {
  factory TaskResponse({
    String? taskName,
    String? description,
    String? dueDate,
    String? completeDate,
    int? point,
    UserResponse? assignee,
    UserResponse? assigneer,
    int? type,
    List<TaskResponse>? listRelatedTask,
    String? createByName,
    int? status,
    int? priority,
    String? id,
    String? createdBy,
    String? createdDate,
  }) = _TaskResponse;

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
}
