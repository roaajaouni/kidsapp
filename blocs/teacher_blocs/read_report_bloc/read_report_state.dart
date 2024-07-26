part of 'read_report_bloc.dart';

@immutable
sealed class ReadReportState {}

final class ReadReportInitial extends ReadReportState {}
class TeacherReadReportSuccessState extends ReadReportState {
  final List< ViewReportModel >viewReportModel;

  TeacherReadReportSuccessState({required this.viewReportModel});
}
class TeacherReadReportFailureState extends ReadReportState {
  final String errorMessage;

  TeacherReadReportFailureState({required this.errorMessage});
}
class TeacherReadReportLoadingState extends ReadReportState {}