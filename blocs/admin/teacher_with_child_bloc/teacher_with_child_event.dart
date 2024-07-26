part of 'teacher_with_child_bloc.dart';

@immutable
sealed class TeacherWithChildEvent {}
class AddTeacherWithChild extends TeacherWithChildEvent{
  final List <TeacherChildModel> teacherWithChildModel;

  AddTeacherWithChild ({required this.teacherWithChildModel});
}