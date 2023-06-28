import 'package:freezed_annotation/freezed_annotation.dart';

import 'concerned_user.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
	factory Event({
		String? id,
		String? type,
		String? background,
		bool? concerned,
		String? userId,
		String? userFullname,
		String? startTime,
		String? endTime,
		String? description,
		List<ConcernedUser>? concernedUser,
	}) = _Event;

	factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}