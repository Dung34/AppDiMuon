import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    String? id,
    String? title,
    String? description,
    String? assignee,
    String? assigner,
    int? point,
    String? parrentTask,
    String? relatedTask,
    String? keyResultId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    int? priority,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
