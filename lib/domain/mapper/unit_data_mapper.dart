import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/unit_response/unit_response.dart';
import '../entity/okr/unit/unit.dart';

class UnitDataMapper extends BaseDataMapper<UnitResponse, Unit>
    with DataMapperMixin {
  @override
  Unit mapToEntity(UnitResponse? data) {
    return Unit(
        id: data?.id,
        name: data?.name,
        parentId: data?.parentId,
        description: data?.description,
        coverImage: data?.coverImage,
        totalMemberCount: data?.totalMemberCount,
        subUnit: data?.subUnit,
        okRsId: data?.okRsId,
        tenantId: data?.tenantId,
        startDate: data?.startDate,
        endDate: data?.endDate,
        totalTask: data?.totalTask,
        taskDone: data?.taskDone,
        owner: data?.owner,
        // status: data?.status,
        createdBy: data?.createdBy,
        createdDate: data?.createdDate);
  }

  @override
  UnitResponse mapToData(Unit entity) {
    return UnitResponse(
      id: entity.id,
      name: entity.name,
      parentId: entity.parentId,
      description: entity.description,
      coverImage: entity.coverImage,
      totalMemberCount: entity.totalMemberCount,
      subUnit: entity.subUnit,
      okRsId: entity.okRsId,
      tenantId: entity.tenantId,
      startDate: entity.startDate,
      endDate: entity.endDate,
      totalTask: entity.totalTask,
      taskDone: entity.taskDone,
      owner: entity.owner,
      // status: entity.status,
    );
  }
}
