import 'package:freezed_annotation/freezed_annotation.dart';

part 'okr.freezed.dart';
part 'okr.g.dart';

@freezed
class OKR with _$OKR {
  factory OKR({
    String? name,
    String? description,
    String? unitId,
    String? progress,
    int? totalObjective,
    int? totalKR,
    int? totalTask,
  }) = _OKR;

  factory OKR.fromJson(Map<String, dynamic> json) => _$OKRFromJson(json);
}
