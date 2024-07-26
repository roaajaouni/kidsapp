import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/teacher_home_model.dart';
import 'package:flutter_childhood/service/teacher_service/teacher_getkids_home_service.dart';
import 'package:meta/meta.dart';

part 'teacher_home_event.dart';
part 'teacher_home_state.dart';

class TeacherHomeBloc extends Bloc<TeacherHomeEvent, TeacherHomeState> {
  TeacherHomeService teacherHomeService=TeacherHomeService();
  TeacherHomeBloc() : super(TeacherHomeInitial()) {
    on<GetAllTeacherKidsEvent >((event, emit) async{
     emit(GetAllTeacherKidsLoadingState());
     try{
final List<dynamic> teacherKidsMap=await teacherHomeService.teacherGetKids();
List<TeacherHomeModel> teacherKidsModel=teacherKidsMap.map((e)=>TeacherHomeModel.fromMap(e)).toList();
 
// emit( GetAllTeacherKidsSuccessState(teacherHomeKids:teacherKidsModel ));
 if (teacherKidsModel.isEmpty) {
          emit(TeacherHomeNoKidsAddedState());
        } else {
          emit(GetAllTeacherKidsSuccessState(teacherHomeKids: teacherKidsModel));
        }
     }
     catch(e){
      emit(GetAllTeacherKidsFailureState(errorMessage: e.toString()));
     }
    });
  }
}
