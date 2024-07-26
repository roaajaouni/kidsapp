import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';
import 'package:flutter_childhood/service/mother_service/view_report_service.dart';
import 'package:meta/meta.dart';

part 'viewreport_event.dart';
part 'viewreport_state.dart';

class ViewreportBloc extends Bloc<ViewreportEvent, ViewreportState> {
  ViewReportService viewReportService=ViewReportService();
  ViewreportBloc() : super(ViewreportInitial()) {
    on<GetAllMyKidsReportsEvent>((event, emit) async{
   emit(GetAllMyKidsReportsLoadingState());
   try{
      var reportmyKidsmap=await viewReportService.getAllReports(event.childId);
          List< ViewReportModel> reportMyKidsModel= List.generate( reportmyKidsmap.length, (index) =>ViewReportModel.fromMap(reportmyKidsmap[index]) );

       // final List< ViewReportModel> myKidsmodel = reportmyKidsmap.map((e)= ViewReportModel.fromMap(e)).toList();
        // emit(GetAllMyKidsReportsSuccessState(reportMyKids: reportMyKidsModel));
        if (reportMyKidsModel.isEmpty) {
          emit(MyKidsReportNoAddedState());
        } else {
          emit(GetAllMyKidsReportsSuccessState(reportMyKids: reportMyKidsModel));
        }
   }
   catch(e){
    emit( GetAllMyKidsReportsFailureState(errorMessage: e.toString()));
   }
    });
  }
}
