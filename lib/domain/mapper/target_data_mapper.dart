import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/target/target_response.dart';
import '../entity/target/target.dart';

class TargetDataMapper extends BaseDataMapper<TargetResponse, Target>
    with DataMapperMixin {
  @override
  TargetResponse mapToData(Target entity) {
    return TargetResponse(
      actual: entity.actual,
      description: entity.description,
      endDate: entity.endDate,
      startDate: entity.startDate,
      id: entity.id,
      status: entity.status,
      target: entity.target,
      title: entity.title,
      type: entity.type,
      userId: entity.userId,
    );
  }

  @override
  Target mapToEntity(TargetResponse? data) {
    return Target(
        actual: data?.actual,
        description: data?.description,
        endDate: data?.endDate,
        startDate: data?.startDate,
        id: data?.id,
        status: data?.status,
        target: data?.target,
        title: data?.title,
        type: data?.type,
        userId: data?.userId);
  }
}
