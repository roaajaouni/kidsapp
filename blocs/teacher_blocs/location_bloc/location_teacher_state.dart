part of 'location_teacher_bloc.dart';

@immutable
sealed class LocationTeacherState {}

final class LocationTeacherInitial extends LocationTeacherState {}
class ChildLocationIsAddState extends LocationTeacherState {
  final TeacherLocationModel newLocation;

  ChildLocationIsAddState({required this.newLocation});
}
class ChildLocationFailureState extends LocationTeacherState {
  final String errorMessage;

  ChildLocationFailureState({required this.errorMessage});
}
class ChildLocationLoadingState extends LocationTeacherState{}
class ChildLocationIsFetchedState extends LocationTeacherState{
  final TeacherLocationModel teacherLocationModel;

  ChildLocationIsFetchedState({required this.teacherLocationModel});
}