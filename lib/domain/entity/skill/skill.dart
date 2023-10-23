import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.g.dart';
part 'skill.freezed.dart';

@unfreezed
class Skill with _$Skill {
  factory Skill({
    String? id,
    String? name,
    int? point,
    String? description,
    String? icon,
    String? userId,
  }) = _Skill;
  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
