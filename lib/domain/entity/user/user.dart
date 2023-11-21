import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    String? id,
    String? login,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? avatar,
    String? coverImage,
    bool? activated,
    int? rank,
    int? role,
    int? membershipType,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
