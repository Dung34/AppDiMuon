import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/okr/unit/unit.dart';

part 'unit_response.freezed.dart';
part 'unit_response.g.dart';

@freezed
class UnitResponse with _$UnitResponse {
  factory UnitResponse({
    String? id,
    String? name,
    String? parentId,
    String? description,
    String? coverImage,
    int? totalMemberCount,
    List<Unit>? subUnit,
    String? okRsId,
    String? tenantId,
    String? startDate,
    String? endDate,
    int? totalTask,
    int? taskDone,
    String? owner,
    // dynamic status,
    String? createdBy,
    String? createdDate,
  }) = _UnitResponse;

  factory UnitResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitResponseFromJson(json);
}
