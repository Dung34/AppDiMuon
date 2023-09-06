import '../../data/mapper/base/base_data_mapper.dart';
import '../../data/model/report_response/report_response.dart';
import '../entity/report/report_daily.dart';

class ReportDataMapper extends BaseDataMapper<ReportResponse, ReportDaily>
    with DataMapperMixin {
  @override
  ReportDaily mapToEntity(ReportResponse? data) {
    return ReportDaily(
        id: data?.id,
        title: data?.title,
        description: data?.description,
        date: data?.date);
  }

  @override
  ReportResponse mapToData(ReportDaily entity) {
    return ReportResponse(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      date: entity.date,
    );
  }
}
