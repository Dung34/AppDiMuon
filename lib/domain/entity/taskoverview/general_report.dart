import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_report.g.dart';
part 'general_report.freezed.dart';

@freezed
class GeneralReport with _$GeneralReport {
  factory GeneralReport({
    String? id,
    String? title,
    String? description,
    String? dateTo,
    String? dateFrom,
    String? workDone,
    String? issue,
    String? add,
  }) = _GeneralReport;
  factory GeneralReport.fromJson(Map<String, dynamic> json) =>
      _$GeneralReportFromJson(json);
}
