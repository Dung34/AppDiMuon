import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/gereport_response/list_general_report_res.dart';
import '../entity/taskoverview/list_general_report.dart';

class ListGeneralReportMapper
    extends BaseDataMapper<ListGeneralReportRes, ListGeneralReport>
    with DataMapperMixin {
  @override
  ListGeneralReport mapToEntity(ListGeneralReportRes? data) {
    return ListGeneralReport(data: data?.data, totalCount: data?.totalCount);
  }

  @override
  ListGeneralReportRes mapToData(ListGeneralReport entity) {
    return ListGeneralReportRes(
        data: entity.data, totalCount: entity.totalCount);
  }
}
