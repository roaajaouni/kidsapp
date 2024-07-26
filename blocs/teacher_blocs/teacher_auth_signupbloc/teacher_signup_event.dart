part of 'teacher_signup_bloc.dart';

@immutable
sealed class TeacherSignupEvent {}
class AddTeacherSignupInfo extends TeacherSignupEvent {
  final TeacherSignUpModel teacherSignUpModel;

  AddTeacherSignupInfo({required this.teacherSignUpModel});
}