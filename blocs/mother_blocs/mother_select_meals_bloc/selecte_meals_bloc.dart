import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_meals_model.dart';
import 'package:flutter_childhood/service/mother_service/select_meals_service.dart';

import 'package:meta/meta.dart';



part 'selecte_meals_event.dart';
part 'selecte_meals_state.dart';

class SelecteMealsBloc extends Bloc<SelecteMealsEvent, SelecteMealsState> {
  SelectMealsService selectMealsService = SelectMealsService();
  SelecteMealsBloc() : super(SelecteMealsInitial()) {
    on<GetAllMealsEvent>((event, emit) async {
      emit(MealsLoadingState());
      try {
        var mealsMap = await selectMealsService.getAllMeals();
        List<MoherMealsModel> mealsModel = List.generate(
            mealsMap.length, (index) => MoherMealsModel.fromMap(mealsMap[index]));
            emit(GetAllMealsSuccesState(moherMealsModel:mealsModel ));
      } catch (e) {
        emit(MealsFailureState(errorMessage: e.toString()));
      }
    });


    on<SelectMealEvent>(((event, emit)async  {
    try {
    // print(event.id);
    // print(event.mealName);
    await selectMealsService.postSelectMeals(event.mealName,event.id);

      // print("================${result.meal}");
    } catch (e) {

      
    }

    
     
     }   ));
  }
}
