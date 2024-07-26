part of 'child_location_bloc.dart';

@immutable
sealed class ChildLocationState {}

final class ChildLocationInitial extends ChildLocationState {}
class ChildLocationIsAddState extends ChildLocationState {
  final MotherLocationModel newLocation;

  ChildLocationIsAddState({required this.newLocation});
}
class ChildLocationFailureState extends ChildLocationState {
  final String errorMessage;

  ChildLocationFailureState({required this.errorMessage});
}
class ChildLocationLoadingState extends ChildLocationState{}
class ChildLocationIsFetchedState extends ChildLocationState{
  final MotherLocationModel motherLocationModel;

  ChildLocationIsFetchedState({required this.motherLocationModel});
}