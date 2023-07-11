import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    String? id,
    String? username,
    String? fullname,
    String? avatar,
    String? coverImage,
    String? dob,
    int? role,
    String? createdDate,
    String? position,
    String? company,
    String? email,
    String? phoneNumber,
    DateTime? lastModifiedDate,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
