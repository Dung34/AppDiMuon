import '../../../domain/entity/skill/skill.dart';
import '../../model/api/base_response.dart';

abstract class SkillRepository {
  Future<ResponseWrapper<List<Skill>>> getAllSkill(String userId);
  Future<ResponseWrapper<Skill>> getDetailSkill(String id);
  Future<ResponseWrapper<Skill>> updateSkill(Skill skill);
  Future<ResponseWrapper<Skill>> createSkill(Skill skill);
  Future<ResponseWrapper<void>> deleteSkill(String id);
}
