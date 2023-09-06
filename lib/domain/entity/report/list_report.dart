import 'report_daily.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_report.g.dart';
part 'list_report.freezed.dart';

class ListReport with _$ListReport {
  factory ListReport({List<ReportDaily>? data, int? totalcount}) = _ListReport;
  factory ListReport.fromJson(Map<String, dynamic> json) =>
      _$ListReportFromJson(json);
}
