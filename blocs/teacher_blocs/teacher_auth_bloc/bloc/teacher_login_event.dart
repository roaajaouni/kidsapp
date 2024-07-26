// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'teacher_login_bloc.dart';

@immutable
sealed class TeacherLoginEvent {}
class AddTeacherLoginInfo extends TeacherLoginEvent {
 final TeacherLoginModel teacherInfo;
  AddTeacherLoginInfo({
    required this.teacherInfo,
  });

}
