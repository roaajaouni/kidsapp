import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/account_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/update_teacher_model.dart';
import 'package:flutter_childhood/service/teacher_service/account_service.dart';
import 'package:flutter_childhood/service/teacher_service/update_teacher_service.dart';
import 'package:meta/meta.dart';

part 'teacher_account_event.dart';
part 'teacher_account_state.dart';

class TeacherAccountBloc extends Bloc<TeacherAccountEvent, TeacherAccountState> {
  TeacheraccountPreviousInfoService  teacheraccountPreviousInfoService=TeacheraccountPreviousInfoService ();
  TeacherEdittingMyAccountService teacherEdittingMyAccountService=TeacherEdittingMyAccountService();
  TeacherAccountBloc() : super(TeacherAccountInitial()) {
    on<GetTeacherPreviousInfoEvent>((event, emit)async {
          emit(GetTeacherAccountLoadingState ());
    try{
var teacherInfoMap= await  teacheraccountPreviousInfoService.getTeacherPreviousInfo();
TeacheraccountPreviousInfoModel teacherInfoModel=  TeacheraccountPreviousInfoModel.fromMap(teacherInfoMap);

emit( GetTeacherAccountSuccessState(teacherAccountPreviousModel:  teacherInfoModel));
    }
    catch(e){
emit(GetTeacherAccountFailureState(errorMessage: e.toString()));
    }
     
    });///

      on<SendTeacherInfoEdittingEvent>(((event, emit) async{
       emit(GetTeacherAccountLoadingState());
  try {
        var result = await teacherEdittingMyAccountService.postTeacherEdittingInfo(event.updateTeacherInfoModel);
        if (result is TeacheraccountPreviousInfoModel) {
          emit( TeacherEdittingState(newTeacherInfo: result));
        } else {
          emit(
            GetTeacherAccountFailureState(
              errorMessage: result,
            ),
          );
        }
      }
catch(e){
  emit(GetTeacherAccountFailureState(errorMessage: e.toString()));
}

    }));
  }
}
