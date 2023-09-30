import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/skill/skill_response.dart';
import '../entity/skill/skill.dart';

class SkillDataMapper extends BaseDataMapper<SkillResponse, Skill>
    with DataMapperMixin {
  @override
  SkillResponse mapToData(Skill entity) {
    return SkillResponse(
        id: entity.id,
        name: entity.name,
        point: entity.point,
        description: entity.description,
        userId: entity.userId,
        icon: entity.icon);
  }

  @override
  Skill mapToEntity(SkillResponse? data) {
    return Skill(
        id: data?.id,
        name: data?.name,
        point: data?.point,
        description: data?.description,
        userId: data?.userId,
        icon: data?.icon);
  }
}
