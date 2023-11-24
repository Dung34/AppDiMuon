import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.g.dart';
part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  factory Activity({String? fullname, String? dateTimeAct, String? action}) =
      _Activity;
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
