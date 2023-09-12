import 'package:freezed_annotation/freezed_annotation.dart';
import 'project.dart';

part 'project_list.freezed.dart';
part 'project_list.g.dart';

@freezed
class ProjectList with _$ProjectList {
  factory ProjectList({
    List<Project>? data,
    int? totalCount,
  }) = _ProjectList;

  factory ProjectList.fromJson(Map<String, dynamic> json) =>
      _$ProjectListFromJson(json);
}
