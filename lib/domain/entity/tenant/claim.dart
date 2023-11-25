import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim.freezed.dart';
part 'claim.g.dart';

@unfreezed
class Claim with _$Claim {
  factory Claim({
    String? name,
    String? description,
    String? department,
    String? tenantId,
    String? id,
    String? createdBy,
    String? createdDate,
  }) = _Claim;

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);
}
