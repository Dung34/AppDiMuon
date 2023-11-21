// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_response.g.dart';
part 'skill_response.freezed.dart';

@freezed
class SkillResponse with _$SkillResponse {
  factory SkillResponse({
    String? id,
    String? name,
    int? point,
    String? description,
    String? icon,
    String? userId,
  }) = _SkillResponse;
  factory SkillResponse.fromJson(Map<String, dynamic> json) =>
      _$SkillResponseFromJson(json);
}
