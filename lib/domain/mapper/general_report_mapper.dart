import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/gereport_response/general_report_response.dart';
import '../entity/taskoverview/general_report.dart';

class GeneralReportMapper
    extends BaseDataMapper<GeneralReportResponse, GeneralReport>
    with DataMapperMixin {
  @override
  GeneralReport mapToEntity(GeneralReportResponse? data) {
    return GeneralReport(
      id: data?.id,
      title: data?.title,
      description: data?.description,
      dateFrom: data?.dateFrom,
      dateTo: data?.dateTo,
      workDone: data?.workDone,
      issue: data?.issue,
      add: data?.add,
    );
  }

  @override
  GeneralReportResponse mapToData(GeneralReport entity) {
    return GeneralReportResponse(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        dateFrom: entity.dateFrom,
        dateTo: entity.dateTo,
        workDone: entity.workDone,
        issue: entity.issue,
        add: entity.add);
  }
}
