import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/api/base_response.dart';
import '../../../../data/repository/remote/gen_report_repository.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/taskoverview/general_report.dart';

part 'general_report_state.dart';

class GeneralReportCubit extends Cubit<GeneralReportState> {
  final GeneralReportRepository _generalReportRepository =
      getIt.get<GeneralReportRepository>();

  GeneralReportCubit() : super(GeneralReportInitial());

  GeneralReport? currentGeneralReport;
  List<GeneralReport> reports = [];
  getAllGeneralReport(String userId) async {
    emit(GeneralReportInitial());
    final response = await _generalReportRepository.getAllGenReport(userId);
    if (response.status == ResponseStatus.success) {
      reports.clear();
      reports.addAll(response.data ?? []);
      emit(GetAllGeneralReportSuccess(reports: reports));
    } else {
      emit(GetAllGeneralReportFailed());
    }
  }

  addGeneralReport(GeneralReport generalReport) async {
    final response =
        await _generalReportRepository.createGenReport(generalReport);
    if (response.status == ResponseStatus.success) {
      emit(AddGeneralReportSuccess(generalReport: response.data!));
    } else {
      emit(AddGeneralReportFailed());
    }
  }

  deleteGeneralReport(String reportId) async {
    final response = await _generalReportRepository.deleteGenReport(reportId);
    if (response.status == ResponseStatus.success) {
      reports.removeWhere((element) => element.id == reportId);
      emit(GetAllGeneralReportSuccess(reports: reports));
      emit(DeleteGeneralReportSuccess());
    } else {
      emit(DeleteGeneralReportFailed());
    }
  }

  getGeneralReportDetail(String reportId) async {
    final response = await _generalReportRepository.getGenReport(reportId);
    if (response.status == ResponseStatus.success) {
      currentGeneralReport = response.data!;
      emit(GetGeneralReportSuccess(generalReport: currentGeneralReport!));
    } else {
      emit(GetGeneralReportFailed());
    }
  }

  updateGeneralReport(GeneralReport generalReport) async {
    final response =
        await _generalReportRepository.updateGenReport(generalReport);
    if (response.status == ResponseStatus.success) {
      currentGeneralReport = response.data!;
      emit(UpdateGeneralReportSuccess(generalReport: currentGeneralReport!));
    } else {
      emit(UpdateGeneralReportFailed());
    }
  }
}
