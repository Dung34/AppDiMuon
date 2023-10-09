import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/okr/objective/objective.dart';

part 'objective_response.freezed.dart';
part 'objective_response.g.dart';

@freezed
class ObjectiveResponse with _$ObjectiveResponse {
  factory ObjectiveResponse({
    String? id,
    String? title,
    String? description,
    String? okrId,
    List<Objective>? relatedObjective,
    String? unitId,
    String? unitName,
    double? process,
  }) = _ObjectiveResponse;

  factory ObjectiveResponse.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveResponseFromJson(json);
}
