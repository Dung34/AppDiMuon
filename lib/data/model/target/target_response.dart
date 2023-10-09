import 'package:freezed_annotation/freezed_annotation.dart';

part 'target_response.g.dart';
part 'target_response.freezed.dart';

@freezed
class TargetResponse with _$TargetResponse {
  factory TargetResponse({
    String? title,
    String? description,
    double? targe,
    double? actual,
    int? type,
    int? status,
    String? userId,
    String? startDate,
    String? endDate,
    String? id,
  }) = _TargetResponse;
  factory TargetResponse.fromJson(Map<String, dynamic> json) =>
      _$TargetResponseFromJson(json);
}
