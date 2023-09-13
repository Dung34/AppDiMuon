part of 'general_report_cubit.dart';

abstract class GeneralReportState extends Equatable {
  const GeneralReportState();

  @override
  List<Object> get props => [];
}

class GeneralReportInitial extends GeneralReportState {}

// ignore: must_be_immutable
class GetAllGeneralReportSuccess extends GeneralReportState {
  List<GeneralReport> reports;
  GetAllGeneralReportSuccess({required this.reports});
  @override
  List<Object> get props => [reports];
}

class GetAllGeneralReportFailed extends GeneralReportState {}

// ignore: must_be_immutable
class AddGeneralReportSuccess extends GeneralReportState {
  GeneralReport generalReport;
  AddGeneralReportSuccess({required this.generalReport});
  @override
  List<Object> get props => [generalReport];
}

class AddGeneralReportFailed extends GeneralReportState {}

class DeleteGeneralReportSuccess extends GeneralReportState {}

class DeleteGeneralReportFailed extends GeneralReportState {}

// ignore: must_be_immutable
class GetGeneralReportSuccess extends GeneralReportState {
  GeneralReport generalReport;
  GetGeneralReportSuccess({required this.generalReport});
  @override
  List<Object> get props => [generalReport];
}

class GetGeneralReportFailed extends GeneralReportState {}

// ignore: must_be_immutable
class UpdateGeneralReportSuccess extends GeneralReportState {
  GeneralReport generalReport;
  UpdateGeneralReportSuccess({required this.generalReport});
  @override
  List<Object> get props => [generalReport];
}

class UpdateGeneralReportFailed extends GeneralReportState {}
