import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    String? id,
    String? username,
    String? fullname,
    String? address,
    String? major,
    String? email,
    String? phoneNumber,
    String? avatar,
    String? company,
    String? dob,
    String? type,
    dynamic error,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
