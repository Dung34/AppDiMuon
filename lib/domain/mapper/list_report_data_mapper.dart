import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/report_response/list_report_response.dart';
import '../entity/report/list_report.dart';

class ListReportDataMapper
    extends BaseDataMapper<ListReportResponse, ListReport>
    with DataMapperMixin {
  @override
  ListReport mapToEntity(ListReportResponse? data) {
    return ListReport(
      data: data?.data,
      totalcount: data?.totalcount,
    );
  }

  @override
  ListReportResponse mapToData(ListReport entity) {
    return ListReportResponse(data: entity.data, totalcount: entity.totalcount);
  }
}
