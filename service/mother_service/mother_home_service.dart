import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MotherHomeService extends BaseService{

  Future getMyKids ()async{
    print('Bearer ${getIt.get<SharedPreferences>().getString('token')}');
    // ! what about token ? here i fetch my kids based on my token
    var response =await dio.get("${baseUrl}getchildmom/",
      options:Options(
           headers: {
             'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4MDI4NDkzLCJpYXQiOjE3MTc5NDIwOTMsImp0aSI6Ijk1MWIxYmQwOTg2MjRhYjJhMmE5NzczOGI5NGE3Y2M0IiwidXNlcl9pZCI6NH0.XWcYB7UXRVd2KF7hvOUug2D8BfBTfWuobl25qNVsVN4',
           },
        ),
    );
    if (response.statusCode ==200){

      return response.data;
    }
    else{
      return ErrorModel(errorMessage: 'The server failure');
    }
  }
}