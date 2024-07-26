part of 'child_location_bloc.dart';

@immutable
sealed class ChildLocationEvent {}
class AddChildLocationEvent extends ChildLocationEvent {
  final int childId;
  final MotherLocationModel motherLocationModel;

  AddChildLocationEvent(  {required this.childId, required this.motherLocationModel});
}
class FetchChildLocationEvent extends ChildLocationEvent{
  final int childId;

  FetchChildLocationEvent({required this.childId});
}