import '../../../domain/entity/skill/skill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_skill_response.g.dart';
part 'list_skill_response.freezed.dart';

@freezed
class ListSkillResponse with _$ListSkillResponse {
  factory ListSkillResponse({List<Skill>? data, int? totalCount}) =
      _ListSkillResponse;
  factory ListSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSkillResponseFromJson(json);
}
