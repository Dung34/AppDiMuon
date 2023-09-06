import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    String? title,
    List<String>? image,
    String? background,
    String? description,
    String? startDate,
    int? status,
    int? isJoin,
    String? endDate,
    int? quantity,
    int? type,
    String? location,
    int? scanner,
    String? id,
    String? createdBy,
    String? createdDate,
    String? lastModifiedBy,
    String? lastModifiedDate,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
