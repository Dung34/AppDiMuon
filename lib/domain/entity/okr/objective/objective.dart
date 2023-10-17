import 'package:freezed_annotation/freezed_annotation.dart';

part 'objective.freezed.dart';
part 'objective.g.dart';

@freezed
class Objective with _$Objective {
  factory Objective({
    String? objectiveId,
    String? title,
    String? description,
    String? okrId,
    List<Objective>? relatedObjective,
    String? unitId,
    String? unitName,
  }) = _Objective;

  factory Objective.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveFromJson(json);
}
