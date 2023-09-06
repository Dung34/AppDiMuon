import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_daily.g.dart';
part 'report_daily.freezed.dart';

@freezed
class ReportDaily with _$ReportDaily {
  factory ReportDaily({
    String? id,
    String? title,
    String? description,
    String? date,
  }) = _ReportDaily;
  factory ReportDaily.fromJson(Map<String, dynamic> json) =>
      _$ReportDailyFromJson(json);
}
