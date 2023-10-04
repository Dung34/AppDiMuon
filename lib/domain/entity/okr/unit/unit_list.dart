import 'package:freezed_annotation/freezed_annotation.dart';

import 'unit.dart';

part 'unit_list.freezed.dart';
part 'unit_list.g.dart';

@freezed
class UnitList with _$UnitList {
  factory UnitList({
    List<Unit>? unitList,
  }) = _UnitList;

  factory UnitList.fromJson(Map<String, dynamic> json) =>
      _$UnitListFromJson(json);
}
