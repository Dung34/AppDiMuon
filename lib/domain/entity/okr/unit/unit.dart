import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@unfreezed
class Unit with _$Unit {
  factory Unit({
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
    // int? status,
    String? createdBy,
    String? createdDate,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
