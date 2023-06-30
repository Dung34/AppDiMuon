import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_member.freezed.dart';
part 'event_member.g.dart';

@freezed
class EventMember with _$EventMember {
  factory EventMember({
    String? id,
    @Default('') String userId,
    String? fullname,
    String? avatar,
    String? checkedInLocation,
    String? checkedInDate,
  }) = _EventMember;

  factory EventMember.fromJson(Map<String, dynamic> json) =>
      _$EventMemberFromJson(json);
}
