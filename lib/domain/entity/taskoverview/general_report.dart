@fre
class GeneralReport extends _$GeneralReport {
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
