part of 'teacher_signup_bloc.dart';

@immutable
sealed class TeacherSignupState {}

final class TeacherSignupInitial extends TeacherSignupState {}
class TeacherSignUpSuccessState extends TeacherSignupState {
  final String successmessage;

  TeacherSignUpSuccessState({required this.successmessage});
}
class TeacherSignUpFailureState  extends TeacherSignupState {
  final String errormessage;

  TeacherSignUpFailureState({required this.errormessage});
}
class TeacherSignUpLoading extends TeacherSignupState {}