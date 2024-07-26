import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_meals_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectMealsService extends BaseService{
  Future getAllMeals() async {
    var response=await dio.get('${baseUrl}getmeal/');
if (response.statusCode==200){
  // print(",,,,,,,,${response.data}");
      return response.data;

}
else {ErrorModel(errorMessage: 'the server failure');}
  }

Future postSelectMeals ( String mealName,int id)async{

 var response= await dio.post('${baseUrl}chosemeal/$id/',data: {
  "meal":mealName
 },
 options:Options(
           headers: {
            'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE3NzU1NzQ4LCJpYXQiOjE3MTc2NjkzNDgsImp0aSI6ImRlNWQxNzhhNTFmMjQ0YWVhZTA2MTRjOTBjZjVlMWUxIiwidXNlcl9pZCI6NH0.DJww_03GND1NHuzNZ6FgoGxs1W2sDQ1nYH-WG91Ileg',
           },
        ),

 );
 if (response.statusCode==200){
  // print(response.data);
 AddMealResponse mealResponse=AddMealResponse.fromMap(response.data);
  return mealResponse;
}
else{
  ErrorModel(errorMessage: 'the server failure');
}

}}
