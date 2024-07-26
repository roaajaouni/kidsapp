import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/signup_model.dart';
import 'package:flutter_childhood/service/teacher_service/auth/teacher_signup.dart';
import 'package:meta/meta.dart';

part 'teacher_signup_event.dart';
part 'teacher_signup_state.dart';

class TeacherSignupBloc extends Bloc<TeacherSignupEvent, TeacherSignupState> {
  TeacherSignUpService teacherSignUpService=TeacherSignUpService();
  TeacherSignupBloc() : super(TeacherSignupInitial()) {
    on<AddTeacherSignupInfo>((event, emit) async{
  try{
    var result=await teacherSignUpService.teacherSignUp(event.teacherSignUpModel);
    if(result is String ){
emit(TeacherSignUpSuccessState(successmessage: result));
    }else{
      emit(TeacherSignUpFailureState(errormessage: result));
    }
  }
  catch(e){
emit(TeacherSignUpFailureState(errormessage: e.toString()));
  }
    });
  }
}
