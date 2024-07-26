part of 'teacher_child_bloc.dart';

@immutable
sealed class TeacherChildEvent {}
class GetAllChildsEvent extends TeacherChildEvent {}