import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/food_model.dart';
import 'package:flutter_childhood/service/teacher_service/food_service.dart';
import 'package:meta/meta.dart';

part 'food_teacher_event.dart';
part 'food_teacher_state.dart';

class FoodTeacherBloc extends Bloc<FoodTeacherEvent, FoodTeacherState> {
  TeacherFoodService teacherFoodService=TeacherFoodService();
  FoodTeacherBloc() : super(FoodTeacherInitial()) {
    on<FetchTeacherMealEvent>((event, emit) async{
      emit(TeacherFoodLoadingState());
      try{
        var teacherFoodMap=await teacherFoodService.getTeacherKidsMeal(event.childId);
        TeacherFoodModel teacherFoodModel=TeacherFoodModel.fromMap( teacherFoodMap);
        emit(TeacherMealIsFetchedState(teacherFoodModel: teacherFoodModel));
      }
      catch(e){
        emit(TeacherFoodFailureState(errorMessage: e.toString()));
      }
    });
  }
}
