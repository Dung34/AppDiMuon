import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    String? name,
    int? status,
    List<ProjectMember>? projectMembers,
    List<Task>? tasks,
    String? id,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class ProjectMember with _$ProjectMember {
  factory ProjectMember({
    String? userId,
    int? role,
  }) = _ProjectMember;

  factory ProjectMember.fromJson(Map<String, dynamic> json) =>
      _$ProjectMemberFromJson(json);
}
