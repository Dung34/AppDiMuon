import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_type.freezed.dart';
part 'event_type.g.dart';

@freezed
class EventType with _$EventType {
  factory EventType({
    String? id,
    int? type,
    String? name,
  }) = _EventType;

  factory EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);
}
