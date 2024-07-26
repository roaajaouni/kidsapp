import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MotherMyAccountService extends BaseService{

  Future getMother()async{
print(getIt.get<SharedPreferences>().getString('token'));
   var response= await dio.get("${baseUrl}getMom/",
   options:Options(
           headers: {
             'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4MDI4NDkzLCJpYXQiOjE3MTc5NDIwOTMsImp0aSI6Ijk1MWIxYmQwOTg2MjRhYjJhMmE5NzczOGI5NGE3Y2M0IiwidXNlcl9pZCI6NH0.XWcYB7UXRVd2KF7hvOUug2D8BfBTfWuobl25qNVsVN4',
           },
        ),
        );
        print("///${response.data}");
if (response.statusCode==200){
  return response.data;
}
else{
  ErrorModel(errorMessage: 'the server failure');
}

  }

// Future  postMotherEdittingInfo(MotherMyAccountModel motherMyAccountModel)async{
// var response=await dio.post("${baseUrl}updatemom/",data:motherMyAccountModel,
//   options:Options(
//            headers: {
//   //           'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
//              'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE3NzU1NzQ4LCJpYXQiOjE3MTc2NjkzNDgsImp0aSI6ImRlNWQxNzhhNTFmMjQ0YWVhZTA2MTRjOTBjZjVlMWUxIiwidXNlcl9pZCI6NH0.DJww_03GND1NHuzNZ6FgoGxs1W2sDQ1nYH-WG91Ileg',
//            },
//         ),

//  );
// if(response.statusCode==200){
//  MotherMyAccountModel newMotherInfo = MotherMyAccountModel.fromMap(response.data);
//       return newMotherInfo;
// }
// else {
//   ErrorModel(errorMessage:'the server failure');
// }


// }
}
///////////////////////////////////////////////////////////////////////////////////////////
// class MotherMyAccountService extends BaseService{

//   Future getMother( int id )async{

//    var response= await dio.get("${baseUrl}getMom/$id/");
// if (response.statusCode==200){
//   return response.data;
// }
// else{
//   ErrorModel(errorMessage: 'the server failure');
// }

//   }

//! method to post editting info
// Future  postMotherEdittingInfo(MotherMyAccountModel motherMyAccountModel)async{
// var response=await dio.post("${baseUrl}editmother/",data:motherMyAccountModel );
// if(response.statusCode==200){
// return response.data;
// }
// else {
//   ErrorModel(errorMessage:'the server failure');
// }

// }

 