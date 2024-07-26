part of 'location_teacher_bloc.dart';

@immutable
sealed class LocationTeacherEvent {}
class AddChildLocationEvent extends LocationTeacherEvent {
  final int childId;
  final TeacherLocationModel teacherLocationModel;

  AddChildLocationEvent(  {required this.childId, required this.teacherLocationModel});
}
class FetchChildLocationEvent extends LocationTeacherEvent{
  final int childId;

  FetchChildLocationEvent({required this.childId});
}