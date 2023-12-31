// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/okr/objective/objective.dart';

part 'okr_response.freezed.dart';
part 'okr_response.g.dart';

@freezed
class OKRResponse with _$OKRResponse {
  factory OKRResponse({
    String? id,
    String? name,
    String? description,
    String? unitId,
    double? process,
    int? totalObjective,
    int? totalKR,
    int? totalTask,
    List<Objective>? objectives,
  }) = _OKRResponse;

  factory OKRResponse.fromJson(Map<String, dynamic> json) =>
      _$OKRResponseFromJson(json);
}
