part of 'report_cubit.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class GetAllReportSuccess extends ReportState {
  final List<ReportDaily> listReport;
  const GetAllReportSuccess({required this.listReport});
}

class GetAllReportFalied extends ReportState {}

class AddReportSuccess extends ReportState {
  final ReportDaily reportDaily;
  const AddReportSuccess({required this.reportDaily});
}

class AddReportFailed extends ReportState {}

class DeleteReportSuccess extends ReportState {}

class DeleteReportFailed extends ReportState {}

class GetReportDetailSuccess extends ReportState {
  final ReportDaily reportDaily;
  const GetReportDetailSuccess({required this.reportDaily});
}

class GetReportDetailFailed extends ReportState {}

class UpdateReportSuccess extends ReportState {
  final ReportDaily reportDaily;
  const UpdateReportSuccess({required this.reportDaily});
}

class UpdateReportFailed extends ReportState {}
