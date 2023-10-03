import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
//import '../../../../data/repository/local/local_data_access.dart';
import '../../../../data/repository/remote/report_repository.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/report/report_daily.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepository _reportRepository = getIt.get<ReportRepository>();
  //final LocalDataAccess _localDataAccess = getIt.get<LocalDataAccess>();

  ReportCubit() : super(ReportInitial());

  ReportDaily? currentReport;
  List<ReportDaily> reports = [];

  getAllReport(String userId) async {
    emit(ReportInitial());

    final response = await _reportRepository.getAllReport(userId);
    if (response.status == ResponseStatus.success) {
      reports.clear();
      reports.addAll(response.data ?? []);
      emit(GetAllReportSuccess(listReport: reports));
    } else {
      emit(GetAllReportFalied());
    }
  }

  addReport(ReportDaily reportDaily) async {
    emit(ReportInitial());
    final response = await _reportRepository.createReport(reportDaily);
    if (response.status == ResponseStatus.success) {
      reports.add(reportDaily);
      emit(AddReportSuccess(reportDaily: reportDaily));
    } else {
      emit(AddReportFailed());
    }
  }

  deleteReport(String reportId) async {
    final response = await _reportRepository.deleteReport(reportId);
    if (response.status == ResponseStatus.success) {
      reports.removeWhere((element) => element.id == reportId);
      emit(DeleteReportSuccess());
      emit(GetAllReportSuccess(listReport: reports));
    } else {
      emit(DeleteReportFailed());
    }
  }

  getReportDetail(String reportId) async {
    final response = await _reportRepository.getReport(reportId);
    if (response.status == ResponseStatus.success) {
      currentReport = response.data!;
      emit(GetReportDetailSuccess(reportDaily: response.data!));
    } else {
      emit(GetReportDetailFailed());
    }
  }

  updateReport(ReportDaily reportDaily) async {
    final response = await _reportRepository.updateReport(reportDaily);
    if (response.status == ResponseStatus.success) {
      currentReport = response.data!;
      emit(UpdateReportSuccess(reportDaily: response.data!));
    } else {
      emit(UpdateReportFailed());
    }
  }
}
