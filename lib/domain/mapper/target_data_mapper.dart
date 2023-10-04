import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/target/list_target_response.dart';
import '../../data/model/target/target_response.dart';
import '../entity/target/list_target.dart';
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

class ListTargetMapper extends BaseDataMapper<ListTargetResponse, ListTarget>
    with DataMapperMixin {
  @override
  ListTargetResponse mapToData(ListTarget entity) {
    return ListTargetResponse(data: entity.data, totalCount: entity.totalCount);
  }

  @override
  ListTarget mapToEntity(ListTargetResponse? data) {
    return ListTarget(data: data?.data, totalCount: data?.totalCount);
  }
}
