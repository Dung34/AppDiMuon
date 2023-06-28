import 'package:freezed_annotation/freezed_annotation.dart';

import 'event.dart';

part 'event_wrapper.freezed.dart';
part 'event_wrapper.g.dart';

@freezed
class EventWrapper with _$EventWrapper {
  factory EventWrapper({
    String? id,
    String? title,
    @Default([]) List<Event>? events,
  }) = _EventWrapper;

  factory EventWrapper.fromJson(Map<String, dynamic> json) =>
      _$EventWrapperFromJson(json);
}
