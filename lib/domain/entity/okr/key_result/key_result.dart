import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_result.freezed.dart';
part 'key_result.g.dart';

@freezed
class KeyResult with _$KeyResult {
  factory KeyResult({
    String? id,
    String? title,
    String? description,
    String? key,
    String? result,
    int? status,
    double? target,
    double? actual,
    String? objectiveId,
    String? okRsId,
    String? dueDate,
    int? totalTask,
    int? doneTask,
    String? createdBy,
    String? createdDate,
  }) = _KeyResult;

  factory KeyResult.fromJson(Map<String, dynamic> json) =>
      _$KeyResultFromJson(json);
}
