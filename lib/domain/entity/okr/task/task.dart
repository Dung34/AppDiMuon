import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@unfreezed
class Task with _$Task {
  factory Task({
    String? id,
    String? title,
    String? description,
    UserEntity? assignee,
    UserEntity? assigner,
    int? point,
    Task? parrentTask,
    List<Task>? relatedTask,
    String? keyResultId,
    String? startDate,
    String? endDate,
    int? status,
    String? statusStr,
    int? priority,
    String? priorityStr,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
