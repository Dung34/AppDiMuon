import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@unfreezed
class Event with _$Event {
  factory Event({
    String? id,
    String? type,
    String? background,
    @Default(false) bool checked,
    @Default(0) int status,
    @Default('') String statusStr,
    @Default(0) int totalUserCount,
    String? userId,
    String? startTime,
    String? endTime,
    String? title,
    String? description,
    String? location,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
