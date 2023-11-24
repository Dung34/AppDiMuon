import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/okr_response/key_result_response.dart';
import '../../data/model/okr_response/objective_response.dart';
import '../../data/model/okr_response/okr_response.dart';
import '../entity/okr/key_result/key_result.dart';
import '../entity/okr/okr_wrapper/okr.dart';
import '../entity/okr/objective/objective.dart';

class OKRDataMapper extends BaseDataMapper<OKRResponse, OKR>
    with DataMapperMixin {
  @override
  OKR mapToEntity(OKRResponse? data) {
    return OKR(
      id: data?.id,
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
      objectiveId: data?.objectiveId,
      title: data?.title,
      description: data?.description,
      okrId: data?.okrId,
      relatedObjective: data?.relatedObjective,
      unitId: data?.unitId,
      unitName: data?.unitName,
    );
  }

  @override
  ObjectiveResponse mapToData(Objective entity) {
    return ObjectiveResponse(
      objectiveId: entity.objectiveId,
      title: entity.title,
      description: entity.description,
      okrId: entity.okrId,
      relatedObjective: entity.relatedObjective,
      unitId: entity.unitId,
      unitName: entity.unitName,
    );
  }
}

class KeyResultDataMapper extends BaseDataMapper<KeyResultResponse, KeyResult>
    with DataMapperMixin {
  @override
  KeyResult mapToEntity(KeyResultResponse? data) {
    return KeyResult(
        id: data?.id,
        title: data?.title,
        description: data?.description,
        key: data?.key,
        result: data?.result,
        target: data?.target,
        actual: data?.actual,
        objectiveId: data?.objectiveId,
        dueDate: data?.dueDate,
        totalTask: data?.totalTask,
        doneTask: data?.doneTask);
  }

  @override
  KeyResultResponse mapToData(KeyResult entity) {
    return KeyResultResponse(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        objectiveId: entity.objectiveId,
        key: entity.key,
        result: entity.result,
        target: entity.target,
        actual: entity.actual,
        okRsId: entity.okRsId);
  }
}
