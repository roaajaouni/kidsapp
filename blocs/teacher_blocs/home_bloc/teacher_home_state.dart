part of 'teacher_home_bloc.dart';

@immutable
sealed class TeacherHomeState {}

final class TeacherHomeInitial extends TeacherHomeState {}
class GetAllTeacherKidsSuccessState extends TeacherHomeState {
  final List<TeacherHomeModel> teacherHomeKids;

  GetAllTeacherKidsSuccessState({required this.teacherHomeKids});
}
class GetAllTeacherKidsFailureState extends TeacherHomeState {
  final String errorMessage;

  GetAllTeacherKidsFailureState({required this.errorMessage});
}
class GetAllTeacherKidsLoadingState  extends TeacherHomeState {}
class TeacherHomeNoKidsAddedState extends TeacherHomeState  {}