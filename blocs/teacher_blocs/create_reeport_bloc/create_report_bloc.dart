import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/create_report_model.dart';
import 'package:flutter_childhood/service/teacher_service/create_report_service.dart';
import 'package:meta/meta.dart';

part 'create_report_event.dart';
part 'create_report_state.dart';

class CreateReportBloc extends Bloc<CreateReportEvent, CreateReportState> {
  TeacherCreateReportService teacherCreateReportService=TeacherCreateReportService();
  CreateReportBloc() : super(CreateReportInitial()) {
    on<TeacherCreateReportEvent>((event, emit)async {
     emit(TeacherCreateReportLoadingState());
     try{
var result = await teacherCreateReportService.addChildReports(event.teacherCreateReportModel, event.childId);
if(result is TeacherCreateReportModel){
  emit(TeacherCreateReportSuccessState(newChildReport: result));
}else{
  emit(TeacherCreateReportFailureState(errorMessage: result));
}
     }
     catch(e){
emit(TeacherCreateReportFailureState(errorMessage: e.toString()));
     }
    });
  }
}
