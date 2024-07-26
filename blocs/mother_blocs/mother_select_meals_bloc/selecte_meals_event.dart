part of 'selecte_meals_bloc.dart';

@immutable
sealed class SelecteMealsEvent {}
class GetAllMealsEvent extends SelecteMealsEvent {}
class SelectMealEvent extends SelecteMealsEvent {
  final  String mealName;
  final int id;

  SelectMealEvent({required this.id, required this.mealName});
}
