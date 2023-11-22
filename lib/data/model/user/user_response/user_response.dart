import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse(
      {String? id,
      String? login,
      String? referralCode,
      String? firstName,
      String? lastName,
      String? fullName,
      String? email,
      String? phoneNumber,
      String? imageUrl,
      bool? activated,
      String? langKey,
      String? createdBy,
      String? createdDate,
      String? lastModifiedBy,
      String? lastModifiedDate,
      List<String>? authorities,
      int? membershipType}) = _UserReponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
