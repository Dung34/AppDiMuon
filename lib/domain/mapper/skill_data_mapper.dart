import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/skill/list_skill_response.dart';
import '../../data/model/skill/skill_response.dart';
import '../entity/skill/list_skill.dart';
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

class ListSkillMapper extends BaseDataMapper<ListSkillResponse, ListSkill>
    with DataMapperMixin {
  @override
  ListSkillResponse mapToData(ListSkill entity) {
    return ListSkillResponse(data: entity.data, totalCount: entity.totalCount);
  }

  @override
  ListSkill mapToEntity(ListSkillResponse? data) {
    return ListSkill(data: data?.data, totalCount: data?.totalCount);
  }
}
