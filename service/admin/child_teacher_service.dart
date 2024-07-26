
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class AdminService extends BaseService{

  Future getAllChilds() async{
    response = await dio.get("${baseUrl}getchilds/" );
    if (response.statusCode == 200) {
    
      return response.data;
      
    }else{
      return ErrorModel(errorMessage: "Server Failure");
    }
  }


Future getAllTeachers() async{
    response = await dio.get("${baseUrl}getTeachers/" );
    if (response.statusCode == 200) {
      
      return response.data;
      
    }else{
      return ErrorModel(errorMessage: "Server Failure");
    }
  }


}