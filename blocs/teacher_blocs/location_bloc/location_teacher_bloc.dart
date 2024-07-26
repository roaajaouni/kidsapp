import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/send_location.dart';
import 'package:flutter_childhood/service/teacher_service/location_service.dart';
import 'package:meta/meta.dart';

part 'location_teacher_event.dart';
part 'location_teacher_state.dart';

class LocationTeacherBloc extends Bloc<LocationTeacherEvent, LocationTeacherState> {
  TeacherLocationService teacherLocationService=TeacherLocationService();
  LocationTeacherBloc() : super(LocationTeacherInitial()) {
    on<AddChildLocationEvent>((event, emit) async{
emit(ChildLocationLoadingState());
try{
var result =await teacherLocationService.sendTeacherLocation(event.childId, event.teacherLocationModel);
if ( result is TeacherLocationModel){
emit(ChildLocationIsAddState(newLocation:result ));

}}
catch(e){

emit(ChildLocationFailureState(errorMessage: e.toString()));
    }
  });

on<FetchChildLocationEvent>((event, emit) async{
emit(ChildLocationLoadingState());
try{
var locationChildMap=await  teacherLocationService.fetchTeacherLocation(event.childId);
TeacherLocationModel teacherLocationModel=TeacherLocationModel.fromMap( locationChildMap);
emit(ChildLocationIsFetchedState(teacherLocationModel: teacherLocationModel));

}
catch(e){
emit(ChildLocationFailureState(errorMessage: e.toString()));
}

});

  }
}
