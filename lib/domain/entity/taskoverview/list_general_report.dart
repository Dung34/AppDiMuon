import 'package:freezed_annotation/freezed_annotation.dart';
import 'general_report.dart';

part 'list_general_report.g.dart';
part 'list_general_report.freezed.dart';

@freezed
class ListGeneralReport with _$ListGeneralReport {
  factory ListGeneralReport({
    List<GeneralReport>? data,
    int? totalCount,
  }) = _ListGeneralReport;
  factory ListGeneralReport.fromJson(Map<String, dynamic> json) =>
      _$ListGeneralReportFromJson(json);
}
