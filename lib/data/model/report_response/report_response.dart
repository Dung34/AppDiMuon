import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_response.g.dart';
part 'report_response.freezed.dart';

@freezed
class ReportResponse with _$ReportResponse {
  factory ReportResponse({
    String? id,
    String? title,
    String? description,
    String? date,
  }) = _ReportResponse;
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
}
