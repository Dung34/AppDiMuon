import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_response.freezed.dart';
part 'event_response.g.dart';

@freezed
class EventResponse with _$EventResponse {
  factory EventResponse({
    String? title,
    String? background,
    String? location,
    String? description,
    String? startDate,
    String? endDate,
    int? status,
    int? quantity,
    bool? checked,
    String? id,
    String? createdDate,
    String? lastModifiedDate,
  }) = _EventResponse;

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
}
