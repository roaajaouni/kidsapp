import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewReportService extends BaseService{
  Future getAllReports(int id)async{
var response= await dio.get('${baseUrl}readreport/$id/',
options: Options(
  headers: {
    'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
  }
)
);
if (response.statusCode==200){
  return response.data;
}
else{
  return ErrorModel(errorMessage: 'server failure');
}
  }
}