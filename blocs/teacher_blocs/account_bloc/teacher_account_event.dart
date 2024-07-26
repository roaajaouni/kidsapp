part of 'teacher_account_bloc.dart';

@immutable
sealed class TeacherAccountEvent {}
class GetTeacherPreviousInfoEvent extends TeacherAccountEvent {}
class SendTeacherInfoEdittingEvent extends TeacherAccountEvent {
  final UpdateTeacherInfoModel updateTeacherInfoModel;

   SendTeacherInfoEdittingEvent({required this.updateTeacherInfoModel});
}