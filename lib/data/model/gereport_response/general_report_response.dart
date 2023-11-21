// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_report_response.g.dart';
part 'general_report_response.freezed.dart';

@freezed
class GeneralReportResponse with _$GeneralReportResponse {
  factory GeneralReportResponse({
    String? id,
    String? title,
    String? description,
    String? dateTo,
    String? dateFrom,
    String? workDone,
    String? issue,
    String? add,
  }) = _GeneralReportResponse;
  factory GeneralReportResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralReportResponseFromJson(json);
}
