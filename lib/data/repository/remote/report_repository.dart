import '../../../domain/entity/report/report_daily.dart';
import '../../model/api/base_response.dart';

abstract class ReportRepository {
  Future<ResponseWrapper<List<ReportDaily>>> getAllReport(String userId);
  Future<ResponseWrapper<ReportDaily>> createReport(ReportDaily reportDaily);
  Future<ResponseWrapper<ReportDaily>> getReport(String reportId);
  Future<ResponseWrapper<void>> deleteReport(String reportId);
  Future<ResponseWrapper<ReportDaily>> updateReport(ReportDaily reportDaily);
}
