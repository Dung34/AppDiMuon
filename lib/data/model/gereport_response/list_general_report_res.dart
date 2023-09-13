import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entity/taskoverview/general_report.dart';

part 'list_general_report_res.g.dart';
part 'list_general_report_res.freezed.dart';

@freezed
class ListGeneralReportRes with _$ListGeneralReportRes {
  factory ListGeneralReportRes({
    List<GeneralReport>? data,
    int? totalCount,
  }) = _ListGeneralReportRes;
  factory ListGeneralReportRes.fromJson(Map<String, dynamic> json) =>
      _$ListGeneralReportResFromJson(json);
}
