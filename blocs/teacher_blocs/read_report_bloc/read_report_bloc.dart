import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';
import 'package:flutter_childhood/service/teacher_service/read_report_service.dart';
import 'package:meta/meta.dart';

part 'read_report_event.dart';
part 'read_report_state.dart';

class ReadReportBloc extends Bloc<ReadReportEvent, ReadReportState> {
  TeacherReadReportService teacherReadReportService=TeacherReadReportService();
  ReadReportBloc() : super(ReadReportInitial()) {
    on<TeacherReadReportEvent>((event, emit)async {
      emit(TeacherReadReportLoadingState());
      try{
 var reportmyKidsmap=await teacherReadReportService.teacherGetReport(event.childId);
  List <ViewReportModel> reportmyKidsmodel=List.generate(reportmyKidsmap.length, (index) => ViewReportModel.fromMap(reportmyKidsmap[index]));
 emit(TeacherReadReportSuccessState(viewReportModel:reportmyKidsmodel));
      }
      catch(e){
        emit(TeacherReadReportFailureState(errorMessage: e.toString()));
      }
    });
  }
}
