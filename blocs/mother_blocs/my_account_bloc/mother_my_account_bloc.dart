import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/my_account_model.dart';
import 'package:flutter_childhood/model/mother_app_model/update_mother_info.dart';
import 'package:flutter_childhood/service/mother_service/mother_update_info_service.dart';
import 'package:flutter_childhood/service/mother_service/my_account_service.dart';
import 'package:meta/meta.dart';

part 'mother_my_account_event.dart';
part 'mother_my_account_state.dart';

class MotherMyAccountBloc extends Bloc<MotherMyAccountEvent, MotherMyAccountState> {
  MotherMyAccountService motherMyAccountService=MotherMyAccountService();
  MotherEdittingMyAccountService motherEdittingMyAccountService=MotherEdittingMyAccountService();
  MotherMyAccountBloc() : super(MotherMyAccountInitial()) {
    on<GetMotherEvent >((event, emit) async{
    emit(GetMotherAccountLoadingState());
    try{
var motherInfoMap= await motherMyAccountService.getMother();
MotherMyAccountModel motherInfoModel= MotherMyAccountModel.fromMap(motherInfoMap[0]);

emit(GetMotherAccountSuccessState(motherMyAccountModel: motherInfoModel));
    }
    catch(e){
emit(GetMotherAccountFailureState(errorMessage: e.toString()));
    }
    });


    on<SendMotherInfoEdittingEvent>(((event, emit) async{
       emit(GetMotherAccountLoadingState());
  try {
        var result = await motherEdittingMyAccountService.postMotherEdittingInfo(event.updateMotherInfoModel);
        if (result is MotherMyAccountModel) {
          emit(MotherEdittingState(newMotherInfo: result));
        } else {
          emit(
            GetMotherAccountFailureState(
              errorMessage: result,
            ),
          );
        }
      }
catch(e){
  emit(GetMotherAccountFailureState(errorMessage: e.toString()));
}

    }));
  }
}
