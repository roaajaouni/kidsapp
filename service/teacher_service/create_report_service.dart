import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/create_report_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherCreateReportService extends BaseService{
  Future addChildReports (TeacherCreateReportModel teacherCreateReportModel ,int id)async{
     print(" ]]]]]]]]]]${ getIt.get<SharedPreferences>().getString('teacher_token')} ");
var response=await dio.post("${baseUrl}createreport/$id/",data:teacherCreateReportModel.toMap() ,
options: Options(
  headers: {
    "Authorization": "Bearer ${ getIt.get<SharedPreferences>().getString('teacher_token')} "
 //"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIwOTY5OTMxLCJpYXQiOjE3MTgzNzc5MzEsImp0aSI6ImU2OWI2YThjZDViNTQ1MjM4ZjgzOTY1M2U2MWYxMzlmIiwidXNlcl9pZCI6NX0.CsPpDOXosMeSktBetz8xeHROgxpjEIw6M00aWIBMl58",
  }
));
if(response.statusCode==200){
return response.data;
  }
  else{
    ErrorModel(errorMessage:"there are problem");
  }
  }
}