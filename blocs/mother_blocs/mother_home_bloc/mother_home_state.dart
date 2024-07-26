part of 'mother_home_bloc.dart';

@immutable
sealed class MotherHomeState {}

final class MotherHomeInitial extends MotherHomeState {}
class MotherHomeGetAllMyKidsSuccessState extends MotherHomeState {
  final List<HomeMotherModel> motherHomeKids;

  MotherHomeGetAllMyKidsSuccessState({required this.motherHomeKids});
}
class MotherHomeGetAllMyKidsFailureState extends MotherHomeState {
  final String errorMessage;

   MotherHomeGetAllMyKidsFailureState ({required this.errorMessage});
}
class MotherHomeGetAllMyKidsLoadingState extends MotherHomeState {}
class MotherHomeNoKidsAddedState extends MotherHomeState {}