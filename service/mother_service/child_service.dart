import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildService extends BaseService {
  Future addChildInfo(ChildInfoModel childInfoModel) async {
    print('----------Bearer ${getIt.get<SharedPreferences>().getString('token')}');
    response = await dio.post(
      "${baseUrl}addchild/",
      data: childInfoModel.toMap(),
         options:Options(
           headers: {
             'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE3ODcwNTk3LCJpYXQiOjE3MTc3ODQxOTcsImp0aSI6ImUzNGMzNTg1YmUzZTQwZDNiNTBhN2MwOTRhN2YwN2Y2IiwidXNlcl9pZCI6NH0.iYGelJwOJdTxhJ_jEYYh-rDe2V_vVuuffXvVz7UNPok',
           },
        ),
    );
    if (response.statusCode == 200) {
      ChildInfoModel newChild = ChildInfoModel.fromMap(response.data);
      print("222222$newChild");
      return newChild;
    }else{
      return ErrorModel(errorMessage: "There is a  problem");
    }
  }
}
