part of 'read_report_bloc.dart';

@immutable
sealed class ReadReportEvent {}
class TeacherReadReportEvent extends ReadReportEvent {
  final int childId;

  TeacherReadReportEvent({required this.childId});
}