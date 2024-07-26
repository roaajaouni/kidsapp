import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_login_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class MotherLoginService extends BaseService{

  Future motherLogin(MotherLoginModel motherInfo) async{
    response = await dio.post("${baseUrl}token/" ,data: motherInfo.toMap());
    if (response.statusCode == 200) {
      //print('${response.data['access']}');
      return response.data['access'];
      
    }else{
      return ErrorModel(errorMessage: "Server Failure");
    }
  }
}