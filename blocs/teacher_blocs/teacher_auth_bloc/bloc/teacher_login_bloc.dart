import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/teacher_app_model/teacher_login_model.dart';
import 'package:flutter_childhood/service/teacher_service/auth/teacher_login.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'teacher_login_event.dart';
part 'teacher_login_state.dart';

class TeacherLoginBloc extends Bloc<TeacherLoginEvent, TeacherLoginState> {
  TeacherLoginService teacherLoginService=TeacherLoginService();
  TeacherLoginBloc() : super(TeacherLoginInitial()) {
    on<AddTeacherLoginInfo>((event, emit) async{
     emit(TeacherLoginLoadingState());
try{
 var result= await teacherLoginService.teacherLogin(event.teacherInfo);
if(result is String){
  getIt.get<SharedPreferences>().setString('teacher_token',result);
  emit( TeacherLoginSuccesState(teacherToken:result));
}else{
  emit(TeacherLoginFailureState(errormessage: result.errormessage));
}

}
catch(e){
  emit(TeacherLoginFailureState(errormessage: e.toString()));
}


    });
  }
}
