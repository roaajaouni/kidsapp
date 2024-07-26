import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/admin_child_model.dart';
import 'package:flutter_childhood/service/admin/child_teacher_service.dart';
import 'package:meta/meta.dart';

part 'teacher_child_event.dart';
part 'teacher_child_state.dart';

class TeacherChildBloc extends Bloc<TeacherChildEvent, TeacherChildState> {
  AdminService adminService=AdminService();
  TeacherChildBloc() : super(TeacherChildInitial()) {
    on<GetAllChildsEvent>((event, emit) async{
      emit(AdminGetAllChildsLodingState ());
      try{
        final List<dynamic> Kidsmap=await adminService.getAllChilds();
       
        final List<AdminChildModel> Kidsmodel = Kidsmap.map((e)=>AdminChildModel.fromMap(e)).toList();
         emit(AdminGetAllChildsSucessState(childs: Kidsmodel));
        
      }
      catch(e){
        emit(AdminGetAllChildsFailureState(errorMessage:e.toString()));
      }
    });
  }
}
