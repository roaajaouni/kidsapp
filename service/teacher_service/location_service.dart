import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/send_location.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLocationService extends BaseService{
  Future sendTeacherLocation (int id , TeacherLocationModel teacherLocationModel)async{
var response=await dio.post("${baseUrl}sendlocation/$id/",data: teacherLocationModel.toMap(),
options: Options(
  headers: {
    "Authorization": "Bearer ${ getIt.get<SharedPreferences>().getString('teacher_token')} "
  }
)
);
if (response.statusCode == 200) {
      TeacherLocationModel newLocation = TeacherLocationModel.fromMap(response.data);
      return  newLocation;
    }
    else{
      ErrorModel(errorMessage: 'there is a problem');
    }

  }

// ! fetch child location
Future fetchTeacherLocation(int id)async{
  var response = await dio.get("${baseUrl}location/$id/",
  options: Options(
    headers: {
      "Authorization": "Bearer ${getIt.get<SharedPreferences>().getString('teacher_token')}"
    }
  )
  );

  if (response.statusCode==200){
    return response.data;
  }
  else{
ErrorModel(errorMessage: 'the server failure');
  }
}

}