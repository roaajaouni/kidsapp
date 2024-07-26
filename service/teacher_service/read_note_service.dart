import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class TeacherReadNoteService extends BaseService{
  Future getTeacherKidsNotes(int id)async{
    var response =await dio.get("${baseUrl}notes/$id");
    if (response.statusCode==200){
      return response.data;
    }
    else{
      ErrorModel(errorMessage: "there is a problem");
    }
  }
}