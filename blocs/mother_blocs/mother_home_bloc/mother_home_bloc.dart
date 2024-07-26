
import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/home_getkids_model.dart';
import 'package:flutter_childhood/service/mother_service/mother_home_service.dart';
import 'package:meta/meta.dart';

part 'mother_home_event.dart';
part 'mother_home_state.dart';

class MotherHomeBloc extends Bloc<MotherHomeEvent, MotherHomeState> {
  MotherHomeService motherHomeService= MotherHomeService ();
  MotherHomeBloc() : super(MotherHomeInitial()) {
    on<GetAllMyKidsEvent>((event, emit) async{
      
      emit(MotherHomeGetAllMyKidsLoadingState());
      try{
        
        final List<dynamic> myKidsmap=await motherHomeService.getMyKids();
        final List<HomeMotherModel> myKidsmodel = myKidsmap.map((e)=>HomeMotherModel.fromMap(e)).toList();
        // emit(MotherHomeGetAllMyKidsSuccessState(motherHomeKids: myKidsmodel));
         if (myKidsmodel.isEmpty) {
          emit(MotherHomeNoKidsAddedState());
        } else {
          emit(MotherHomeGetAllMyKidsSuccessState(motherHomeKids: myKidsmodel));
        }
        }
      catch(e){

        emit(MotherHomeGetAllMyKidsFailureState(errorMessage:e.toString()));
      }
    });
  }
}
