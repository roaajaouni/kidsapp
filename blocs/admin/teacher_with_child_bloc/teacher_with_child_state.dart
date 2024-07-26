part of 'teacher_with_child_bloc.dart';

@immutable
sealed class TeacherWithChildState {}

final class TeacherWithChildInitial extends TeacherWithChildState {}
class TeacherWithChildAddedSuccessState extends TeacherWithChildState  {
  final List<TeacherChildModel> teacherWithChild;

  TeacherWithChildAddedSuccessState({required this.teacherWithChild});
}
class TeacherWithChildAddedFailureState extends TeacherWithChildState  {
  final String errorMessage;

  TeacherWithChildAddedFailureState({required this.errorMessage});
}
class TeacherWithChildAddedLoadingState extends TeacherWithChildState  {}
