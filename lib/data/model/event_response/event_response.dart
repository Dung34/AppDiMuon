import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_response.freezed.dart';
part 'event_response.g.dart';

@freezed
class EventResponse with _$EventResponse {
  factory EventResponse({
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
  }) = _EventResponse;

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
}
