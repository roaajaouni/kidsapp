import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/teacher_login_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class TeacherLoginService extends BaseService{

  Future teacherLogin (TeacherLoginModel teacherInfo)async{
response=await dio.post('${baseUrl}token/',data: teacherInfo.toMap());
if(response.statusCode==200 ){
  return response.data['access'];
}else {
  return ErrorModel(errorMessage: 'Server failure');
}
  }
}