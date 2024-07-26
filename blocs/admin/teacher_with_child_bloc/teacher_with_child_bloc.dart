import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_child_model.dart';
import 'package:flutter_childhood/service/admin/teacher_with_child_service.dart';
import 'package:meta/meta.dart';

part 'teacher_with_child_event.dart';
part 'teacher_with_child_state.dart';

class TeacherWithChildBloc extends Bloc<TeacherWithChildEvent, TeacherWithChildState> {
  TecherWithChildService techerWithChildService=TecherWithChildService();
  TeacherWithChildBloc() : super(TeacherWithChildInitial()) {
    on<AddTeacherWithChild >((event, emit)async {
      emit (TeacherWithChildAddedLoadingState());
      try{
 final result = await techerWithChildService.postTecherWithChild(event.teacherWithChildModel);
      emit(TeacherWithChildAddedSuccessState(teacherWithChild: result)); 
      
      }
      catch(e){
        emit(TeacherWithChildAddedFailureState(errorMessage: e.toString()));
      }
    });
  }
}
