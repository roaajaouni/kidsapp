part of 'child_bloc.dart';

@immutable
sealed class ChildState {}

final class ChildInitial extends ChildState {}

class ChildAddedState extends ChildState{
  final ChildInfoModel newChildInfo;

  ChildAddedState({required this.newChildInfo});
}

class ChildLoadingState extends ChildState{}

class ChildFailuerState extends ChildState{
  final String errorMessage;

  ChildFailuerState({required this.errorMessage});
}
