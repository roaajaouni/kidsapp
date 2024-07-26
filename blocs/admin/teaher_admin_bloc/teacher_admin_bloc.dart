import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/admin_teacher.dart';
import 'package:flutter_childhood/service/admin/child_teacher_service.dart';
import 'package:meta/meta.dart';
part 'teacher_admin_event.dart';
part 'teacher_admin_state.dart';

class TeacherAdminBloc extends Bloc<TeacherAdminEvent, TeacherAdminState> {
  AdminService adminService  = AdminService();
  // List<AdminTeacherModel> teachers = [];
  TeacherAdminBloc() : super(TeacherAdminInitial()) {

    on<GetAllTeachersEvent>((event, emit)async {

      emit(TeacherAdminLoading());
try{

final List<dynamic> teachersMap=await adminService.getAllTeachers();
       
        final List<AdminTeacherModel> teachersModel = teachersMap.map((e)=>AdminTeacherModel.fromMap(e)).toList();
         emit(TeacherAdminSuccess(teachers: teachersModel));

}
catch(e){
emit(TeacherAdminFailure (errorMessage:e.toString()));
}

 });
  }
}













    







   
  // try {
      //     final response =  await     adminService.getAllTeachers();

      //     (response as List ).forEach((teacher) { 
      //           teachers.add(AdminTeacherModel.fromMap(teacher));
      //     });
      //     // we have to delete it
      //     // if (response.isEmpty) {
      //     //   teachers = teachersExample;
      //     // }
      //        emit(TeacherAdminSuccess(teachers:teachers));

      // } catch (error) {
      //   emit(TeacherAdminFailure(errorMessage: error.toString()));
      // }
