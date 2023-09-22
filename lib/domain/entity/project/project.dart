import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    String? name,
    int? status,
    List<ProjectMembers>? projectMembers,
    List<Task>? tasks,
    String? id,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class ProjectMembers with _$ProjectMembers {
  factory ProjectMembers({
    String? projectId,
    String? userId,
    int? role,
    String? id,
  }) = _ProjectMembers;

  factory ProjectMembers.fromJson(Map<String, dynamic> json) =>
      _$ProjectMembersFromJson(json);
}
