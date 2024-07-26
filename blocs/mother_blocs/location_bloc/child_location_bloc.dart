import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/location_model.dart';
import 'package:flutter_childhood/service/mother_service/location_service.dart';
import 'package:meta/meta.dart';

part 'child_location_event.dart';
part 'child_location_state.dart';

class ChildLocationBloc extends Bloc<ChildLocationEvent, ChildLocationState> {
  MotherLocaionService motherLocaionService=MotherLocaionService();
  ChildLocationBloc() : super(ChildLocationInitial()) {
    on<AddChildLocationEvent>((event, emit)async {
    emit(ChildLocationLoadingState());
    try{
var result =await motherLocaionService.sendMtherLocation(event.childId, event.motherLocationModel);
if ( result is MotherLocationModel){
emit(ChildLocationIsAddState(newLocation:result ));
}
else {
  emit(ChildLocationFailureState(errorMessage: result));
}


    }
    catch(e){
      emit(ChildLocationFailureState(errorMessage: e.toString()));
    }
    });



    on<FetchChildLocationEvent>((event, emit) async{
emit(ChildLocationLoadingState());
try{
var locationChildMap=await  motherLocaionService.fetchMotherLocation(event.childId);
MotherLocationModel motherLocationModel=MotherLocationModel.fromMap( locationChildMap);
emit(ChildLocationIsFetchedState(motherLocationModel: motherLocationModel));

}
catch(e){
emit(ChildLocationFailureState(errorMessage: e.toString()));
}

});
  }
}
