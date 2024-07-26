import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdataeDeleteProfileService extends BaseService{
  Future deleteChild(int id )async{
var response=await dio.delete("${baseUrl}deletechild/$id/");
if (response.statusCode==200){
  return response.data;
}
else{
  ErrorModel(errorMessage: 'there are problem');
}
  }
}
class UpdateCildProfileService extends BaseService{

  Future updateChildInfo(ChildInfoModel childInfoModel,int id)async{
    var response=await dio.post("${baseUrl}updatechilds/$id/",data:childInfoModel.toMap() ,
    options: Options(
      headers: {
            'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
             
           },
    )
    );
if (response.statusCode==200){
  ChildInfoModel newChildInfo=ChildInfoModel.fromMap(response.data);
  return newChildInfo;
}
else{
  ErrorModel(errorMessage: 'there are problem');
}
  }



}
class GetChildPreviousInfoService extends BaseService{

  Future getChildPreviousInfo(int id)async{
    var response=await dio.get("${baseUrl}getchild/$id/");
    if (response.statusCode==200){
      return response.data;
  }
  else {ErrorModel(errorMessage: 'there is a problem');}
}}