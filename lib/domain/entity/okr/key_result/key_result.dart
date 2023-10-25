import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_result.freezed.dart';
part 'key_result.g.dart';

@freezed
class KeyResult with _$KeyResult {
  factory KeyResult(
      {String? id,
      String? title,
      String? description,
      String? key,
      String? result,
      double? target,
      double? actual,
      String? objectiveId,
      String? okRsId}) = _KeyResult;

  factory KeyResult.fromJson(Map<String, dynamic> json) =>
      _$KeyResultFromJson(json);
}
