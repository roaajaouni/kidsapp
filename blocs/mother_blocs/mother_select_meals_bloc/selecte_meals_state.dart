part of 'selecte_meals_bloc.dart';

@immutable
sealed class SelecteMealsState {}

final class SelecteMealsInitial extends SelecteMealsState {}
class MealsLoadingState extends SelecteMealsState {}
class GetAllMealsSuccesState extends SelecteMealsState {
  final List< MoherMealsModel> moherMealsModel;

  GetAllMealsSuccesState({required this.moherMealsModel});
}
class MealsFailureState extends SelecteMealsState {
  final String errorMessage;

  MealsFailureState({required this.errorMessage});
}
class MealsIsSelectedState extends SelecteMealsState {
final MoherMealsModel newMeals;

  MealsIsSelectedState({required this.newMeals});
}