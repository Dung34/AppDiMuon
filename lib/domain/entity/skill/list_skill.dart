import 'skill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_skill.g.dart';
part 'list_skill.freezed.dart';

@freezed
class ListSkill with _$ListSkill {
  factory ListSkill({List<Skill>? data, int? totalCount}) = _ListSkill;
  factory ListSkill.fromJson(Map<String, dynamic> json) =>
      _$ListSkillFromJson(json);
}
