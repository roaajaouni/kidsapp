import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/signup_model.dart';
import 'package:flutter_childhood/service/mother_service/auth/mother_signup_sevice.dart';
import 'package:meta/meta.dart';

part 'signup_mother_event.dart';
part 'signup_mother_state.dart';

class SignupMotherBloc extends Bloc<SignupMotherEvent, SignupMotherState> {
  MotherSignupService motherSignupService=MotherSignupService();
  SignupMotherBloc() : super(SignupMotherInitial()) {
    on<AddMotherSignupInfo>((event, emit) async{
       try{
    var result=await motherSignupService.motherSignup(event.motherSignUpModel);
    if(result is String ){
emit(MotherSignUpSuccessState(successmessage: result));
    }else{
      emit(MotherSignUpFailureState(errormessage: result));
    }
  }
  catch(e){
emit(MotherSignUpFailureState(errormessage: e.toString()));
  }
    });
  }
}
