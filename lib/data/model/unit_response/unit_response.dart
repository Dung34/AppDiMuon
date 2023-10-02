import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/okr/unit/unit.dart';

part 'unit_response.freezed.dart';
part 'unit_response.g.dart';

@freezed
class UnitResponse with _$UnitResponse {
  factory UnitResponse({
    String? name,
    String? parentId,
    String? description,
    String? coverImage,
    String? id,
    String? createdDate,
    int? totalMemberCount,
    List<Unit>? subUnit,
    String? okRsId,
  }) = _UnitResponse;

  factory UnitResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitResponseFromJson(json);
}
