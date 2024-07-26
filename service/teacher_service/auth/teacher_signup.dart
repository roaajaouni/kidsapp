import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_app_model/signup_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class TeacherSignUpService extends BaseService{
Future teacherSignUp( TeacherSignUpModel teacherSignUpModel)async{
    // Map<String,String> data = {
    //   "name" :teacherSignUpModel.username,
    //   "email": teacherSignUpModel.email,
    //   "password": teacherSignUpModel.password,
    // };
  var response =await dio.post("${baseUrl}register/",data:teacherSignUpModel.toMap(),
 );
  
   
  if (response.statusCode==200){
    return response.data;
  }
  else{
    return ErrorModel(errorMessage: 'there is a problem');
  }
}

}