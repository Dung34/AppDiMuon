import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/project/project.dart';

part 'project_list_response.freezed.dart';
part 'project_list_response.g.dart';

@freezed
class ProjectListResponse with _$ProjectListResponse {
  factory ProjectListResponse({
    List<Project>? data,
    int? totalCount,
  }) = _ProjectListResponse;

  factory ProjectListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectListResponseFromJson(json);
}
