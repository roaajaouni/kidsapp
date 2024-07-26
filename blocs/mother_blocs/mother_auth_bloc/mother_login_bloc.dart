import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_login_model.dart';
import 'package:flutter_childhood/service/mother_service/auth/mother_login.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mother_login_event.dart';
part 'mother_login_state.dart';

class MotherLoginBloc extends Bloc<MotherLoginEvent, MotherLoginState> {
  MotherLoginService motherLoginService = MotherLoginService();
  MotherLoginBloc() : super(MotherLoginInitial()) {
    on<AddMotherInfo>((event, emit) async {
      emit(MotherLoginLoadingState());
     try {
  var result = await motherLoginService.motherLogin(event.motherInfo);
  if (result is String) {
    getIt.get<SharedPreferences>().setString('token' , result);
   
    emit(MotherLoginSuccessState(token: result));
  }else{
    emit(MotherLoginFailureState(errorMessage: result.errorMessage));
  }
} catch (e) {
  emit(MotherLoginFailureState(errorMessage: e.toString()));
}
    });
  }
}
