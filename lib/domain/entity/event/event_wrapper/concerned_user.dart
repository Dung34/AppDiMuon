import 'package:freezed_annotation/freezed_annotation.dart';

part 'concerned_user.freezed.dart';
part 'concerned_user.g.dart';

@freezed
class ConcernedUser with _$ConcernedUser {
	factory ConcernedUser({
		String? id,
		String? fullname,
		String? avatar,
	}) = _ConcernedUser;

	factory ConcernedUser.fromJson(Map<String, dynamic> json) => _$ConcernedUserFromJson(json);
}