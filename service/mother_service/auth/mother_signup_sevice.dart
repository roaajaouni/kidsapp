import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/signup_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class MotherSignupService extends BaseService{
  Future motherSignup(MotherSignupModel motherSignupModel )async{
var response=await dio.post("${baseUrl}register/",data: motherSignupModel.toMap());
if (response.statusCode==200){
    return response.data;
  }
  else{
    return ErrorModel(errorMessage: 'there is a problem');
  }
  }
}