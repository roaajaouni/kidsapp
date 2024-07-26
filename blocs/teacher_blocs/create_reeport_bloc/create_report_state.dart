part of 'create_report_bloc.dart';

@immutable
sealed class CreateReportState {}

final class CreateReportInitial extends CreateReportState {}
class TeacherCreateReportSuccessState extends CreateReportState {
  final TeacherCreateReportModel newChildReport;

  TeacherCreateReportSuccessState({required this.newChildReport});
}

class TeacherCreateReportLoadingState extends CreateReportState {}
class TeacherCreateReportFailureState extends CreateReportState {
  final String errorMessage;

  TeacherCreateReportFailureState({required this.errorMessage});
}