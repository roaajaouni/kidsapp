import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/service/mother_service/delete_update_prof_service.dart';
import 'package:meta/meta.dart';

part 'child_ud_prof_event.dart';
part 'child_ud_prof_state.dart';

class ChildUdProfBloc extends Bloc<ChildUdProfEvent, ChildUdProfState> {
  UpdataeDeleteProfileService updataeDeleteProfileService=UpdataeDeleteProfileService();
  UpdateCildProfileService updateCildProfileService=UpdateCildProfileService();
  GetChildPreviousInfoService getChildPreviousInfoService=GetChildPreviousInfoService();
  ChildUdProfBloc() : super(ChildUdProfInitial()) {
    on<DeleteChildEvent>((event, emit) async{
   try{ var result   = await updataeDeleteProfileService.deleteChild(event.childId);
      if (result is String ){
        emit(ChildIsDeletedState(deleteIsSuccess: result));
      }}
   catch(e){
emit(ChildDeletedFailureState(errorMessage: e.toString()));
   }
    });

on<UpdateChildEvent>((event, emit) async{
try{
  var result=await updateCildProfileService.updateChildInfo(event.childInfoModel,event.childId);
  if(result is ChildInfoModel){
    emit(ChildUpdatedIsSuccess(newChildInfo: result
    ));
  }
  else{
emit(ChildUpdatedFailureState(errorMessage: result));
  }
}
catch(e){
  emit(ChildDeletedFailureState(errorMessage: e.toString()));
}

} );

on< GetChildPreviousInfoEvent>((event, emit)async {

  try{
    var myKidsmap= await getChildPreviousInfoService.getChildPreviousInfo(event.childId);
    var myKidsmodel=ChildInfoModel.fromMap(myKidsmap);
    emit(GetChildPreviousInfoState(childInfo: myKidsmodel));
  }
  catch(e){
emit(ChildUpdatedFailureState(errorMessage: e.toString()));
  }
});


    
  }
}
