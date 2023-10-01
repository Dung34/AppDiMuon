import 'target.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_target.g.dart';
part 'list_target.freezed.dart';

@freezed
class ListTarget with _$ListTarget {
  factory ListTarget({List<Target>? data, int? totalCount}) = _ListTarget;
  factory ListTarget.fromJson(Map<String, dynamic> json) =>
      _$ListTargetFromJson(json);
}
