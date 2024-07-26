part of 'food_teacher_bloc.dart';

@immutable
sealed class FoodTeacherState {}

final class FoodTeacherInitial extends FoodTeacherState {}
class TeacherMealIsFetchedState extends FoodTeacherState {

  final TeacherFoodModel teacherFoodModel;

  TeacherMealIsFetchedState({required this.teacherFoodModel});
}
class TeacherFoodFailureState extends FoodTeacherState {
  final String errorMessage;

  TeacherFoodFailureState({required this.errorMessage});
}
class TeacherFoodLoadingState extends FoodTeacherState {}