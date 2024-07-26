part of 'teacher_home_bloc.dart';

@immutable
sealed class TeacherHomeEvent {}
class GetAllTeacherKidsEvent extends TeacherHomeEvent {}