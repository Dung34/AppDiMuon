import 'package:ceo_hn7/domain/entity/report/report_daily.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_report_response.g.dart';
part 'list_report_response.freezed.dart';

@freezed
class ListReportResponse with _$ListReportResponse {
  factory ListReportResponse({List<ReportDaily>? data, int? totalcount}) =
      _ListReportResponse;
  factory ListReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReportResponseFromJson(json);
}
