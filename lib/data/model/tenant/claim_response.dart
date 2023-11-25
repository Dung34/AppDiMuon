import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_response.freezed.dart';
part 'claim_response.g.dart';

@unfreezed
class ClaimResponse with _$ClaimResponse {
  factory ClaimResponse({
    String? name,
    String? description,
    String? department,
    String? tenantId,
    String? id,
    String? createdBy,
    String? createdDate,
  }) = _ClaimResponse;

  factory ClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimResponseFromJson(json);
}
