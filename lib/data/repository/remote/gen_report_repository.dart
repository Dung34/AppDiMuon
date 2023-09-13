import '../../../domain/entity/taskoverview/general_report.dart';

import '../../model/api/base_response.dart';

abstract class GeneralReportRepository {
  Future<ResponseWrapper<List<GeneralReport>>> getAllGenReport(String userId);
  Future<ResponseWrapper<GeneralReport>> getGenReport(String reportId);
  Future<ResponseWrapper<GeneralReport>> createGenReport(
      GeneralReport generalReport);
  Future<ResponseWrapper<GeneralReport>> updateGenReport(
      GeneralReport generalReport);
  Future<ResponseWrapper<void>> deleteGenReport(String reportId);
}
