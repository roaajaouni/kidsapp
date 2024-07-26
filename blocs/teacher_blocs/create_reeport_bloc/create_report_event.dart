// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_report_bloc.dart';

//@immutable
sealed class CreateReportEvent {}
class TeacherCreateReportEvent extends CreateReportEvent {
final int childId;
TeacherCreateReportModel teacherCreateReportModel;
  TeacherCreateReportEvent({
    required this.childId,
    required this.teacherCreateReportModel,
  });
}
