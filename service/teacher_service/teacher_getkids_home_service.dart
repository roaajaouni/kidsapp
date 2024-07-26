import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherHomeService extends BaseService{
  Future teacherGetKids ()async{
    var response =await dio.get("${baseUrl}getchildteacher/",options: Options(
      headers: {
                "Authorization": "Bearer ${ getIt.get<SharedPreferences>().getString('teacher_token')} "

        // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4MjkwMjMyLCJpYXQiOjE3MTgyMDM4MzIsImp0aSI6ImI5MmNmMmRiZTg0OTQxOGE4ZWU2ZmI4NjEyMmFkYzM0IiwidXNlcl9pZCI6NH0.in6Ko7fRlVBhz6eJCCYb3Gfz8CiMatnJwVR4sLh6CCM"
      }
    ));
    if(response.statusCode==200){
      return response.data;
    }
    else{
      return ErrorModel(errorMessage: "there is a problem");
    }
  }
}