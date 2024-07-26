import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/account_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/update_teacher_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherEdittingMyAccountService extends BaseService{

  Future  postTeacherEdittingInfo(UpdateTeacherInfoModel updateTeacherotherInfoModel)async{
var response=await dio.post("${baseUrl}updateteacher/",data:updateTeacherotherInfoModel.toMap(),
  options:Options(
           headers: {
            'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('teacher_token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4MDI4NDkzLCJpYXQiOjE3MTc5NDIwOTMsImp0aSI6Ijk1MWIxYmQwOTg2MjRhYjJhMmE5NzczOGI5NGE3Y2M0IiwidXNlcl9pZCI6NH0.XWcYB7UXRVd2KF7hvOUug2D8BfBTfWuobl25qNVsVN4'
           },
        ),

 );
if(response.statusCode==200){
  TeacheraccountPreviousInfoModel newMotherInfo =  TeacheraccountPreviousInfoModel.fromMap(response.data);
      return newMotherInfo;
}
else {
  ErrorModel(errorMessage:'the server failure');
}


}
}