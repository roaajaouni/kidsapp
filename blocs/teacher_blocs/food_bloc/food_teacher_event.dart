part of 'food_teacher_bloc.dart';

@immutable
sealed class FoodTeacherEvent {}
class FetchTeacherMealEvent extends FoodTeacherEvent {
  final int childId;

  FetchTeacherMealEvent({required this.childId});
}