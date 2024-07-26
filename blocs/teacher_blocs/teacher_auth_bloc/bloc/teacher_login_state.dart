part of 'teacher_login_bloc.dart';

@immutable
sealed class TeacherLoginState {}

final class TeacherLoginInitial extends TeacherLoginState {}
class TeacherLoginSuccesState extends  TeacherLoginState {
  final String teacherToken;

  TeacherLoginSuccesState({required this.teacherToken});
}
class TeacherLoginFailureState extends TeacherLoginState {
  final String errormessage;

  TeacherLoginFailureState({required this.errormessage});
}
class TeacherLoginLoadingState extends TeacherLoginState {}