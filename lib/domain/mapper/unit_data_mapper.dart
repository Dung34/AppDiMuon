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
      parrentId: data?.parentId,
      description: data?.description,
      coverImage: data?.coverImage,
      totalMemberCount: data?.totalMemberCount,
      subUnit: data?.subUnit,
      okRsId: data?.okRsId,
    );
  }

  @override
  UnitResponse mapToData(Unit entity) {
    return UnitResponse(
        id: entity.id,
        name: entity.name,
        parentId: entity.parrentId,
        description: entity.description,
        coverImage: entity.coverImage);
  }
}
