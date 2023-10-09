import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/okr_response/objective_response.dart';
import '../../data/model/okr_response/okr_response.dart';
import '../entity/okr/okr_wrapper/okr.dart';
import '../entity/okr/objective/objective.dart';

class OKRDataMapper extends BaseDataMapper<OKRResponse, OKR>
    with DataMapperMixin {
  @override
  OKR mapToEntity(OKRResponse? data) {
    return OKR(
      name: data?.name,
      description: data?.description,
      unitId: data?.unitId,
      process: data?.process,
      totalObjective: data?.totalObjective,
      totalKR: data?.totalKR,
      totalTask: data?.totalTask,
      objectives: data?.objectives,
    );
  }

  @override
  OKRResponse mapToData(OKR entity) {
    return OKRResponse(
      name: entity.name,
      description: entity.description,
      unitId: entity.unitId,
      process: entity.process,
      totalObjective: entity.totalObjective,
      totalKR: entity.totalKR,
      totalTask: entity.totalTask,
      objectives: entity.objectives,
    );
  }
}

class ObjectiveDataMapper extends BaseDataMapper<ObjectiveResponse, Objective>
    with DataMapperMixin {
  @override
  Objective mapToEntity(ObjectiveResponse? data) {
    return Objective(
        id: data?.id,
        title: data?.title,
        description: data?.description,
        okrId: data?.okrId,
        relatedObjective: data?.relatedObjective,
        unitId: data?.unitId,
        unitName: data?.unitName,
        process: data?.process);
  }

  ObjectiveResponse mapToData(Objective entity) {
    return ObjectiveResponse(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      okrId: entity.okrId,
      relatedObjective: entity.relatedObjective,
      unitId: entity.unitId,
      unitName: entity.unitName,
      process: entity.process,
    );
  }
}
