import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_statistic.freezed.dart';
part 'checkin_statistic.g.dart';

@freezed
class CheckinStatistic with _$CheckinStatistic {
  factory CheckinStatistic(
    String? dateNow,
    int? workDay,
    int? lateDay,
    int? leaveDay,
    List<String>? listEventCheckin,
  ) = _CheckinStatistic;

  factory CheckinStatistic.fromJson(Map<String, dynamic> json) =>
      _$CheckinStatisticFromJson(json);
}
