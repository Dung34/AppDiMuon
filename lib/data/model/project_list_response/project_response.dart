import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/project/project.dart';
import '../../../domain/entity/project/task.dart';

part 'project_response.freezed.dart';
part 'project_response.g.dart';

@freezed
class ProjectResponse with _$ProjectResponse {
  factory ProjectResponse({
    String? name,
    int? status,
    List<ProjectMembers>? projectMembers,
    List<Task>? tasks,
    String? id,
    String? createdBy,
    String? createdDate,
  }) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}
