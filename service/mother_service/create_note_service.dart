import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/create_note_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MotherCreateNoteService extends BaseService{
  Future addChildNote(MotherCreateNoteModel motherCreateModel,int id)async{
    print("name: =====================    ${motherCreateModel.name}");

    Map<String,String> data = {
      "name" : motherCreateModel.name,
      "notes": motherCreateModel.notes
    };
    var response= await dio.post("${baseUrl}createnotes/$id/",data:data,
      options:Options(
           headers: {
            'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}', 
            //  'Authorization': 'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE3NzU1NzQ4LCJpYXQiOjE3MTc2NjkzNDgsImp0aSI6ImRlNWQxNzhhNTFmMjQ0YWVhZTA2MTRjOTBjZjVlMWUxIiwidXNlcl9pZCI6NH0.DJww_03GND1NHuzNZ6FgoGxs1W2sDQ1nYH-WG91Ileg',
           },
        ),
    );
    if(response.statusCode==200){
      MotherCreateNoteModel newchildnote=MotherCreateNoteModel.fromMap(response.data);
      return newchildnote;
    }
    else{
      return ErrorModel(errorMessage: 'server failure');
    }
  }
}