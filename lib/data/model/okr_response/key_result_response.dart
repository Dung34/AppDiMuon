import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_result_response.freezed.dart';
part 'key_result_response.g.dart';

@freezed
class KeyResultResponse with _$KeyResultResponse {
  factory KeyResultResponse({
    String? id,
    String? title,
    String? description,
    String? objectiveId,
    String? key,
    String? result,
    double? target,
    double? actual,
    String? okRsId,
    String? dueDate,
    int? totalTask,
    int? doneTask,
    String? createdBy,
    String? createdDate,
  }) = _KeyResultResponse;

  factory KeyResultResponse.fromJson(Map<String, dynamic> json) =>
      _$KeyResultResponseFromJson(json);
}
