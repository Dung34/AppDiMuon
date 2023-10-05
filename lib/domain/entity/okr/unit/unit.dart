import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@unfreezed
class Unit with _$Unit {
  factory Unit({
    String? id,
    String? name,
    String? parrentId,
    String? description,
    String? coverImage,
    int? totalMemberCount,
    List<Unit>? subUnit,
    String? okRsId,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
