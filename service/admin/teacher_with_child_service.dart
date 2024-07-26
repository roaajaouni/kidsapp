import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/teacher_child_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

class  TecherWithChildService extends BaseService{

  Future postTecherWithChild (List< TeacherChildModel >techerWithChild)async{
var response =await dio.post("${baseUrl}childteacher/",data: techerWithChild.map((tc) => tc.toMap()).toList());

if (response.statusCode==200){


// TeacherChildModel newTeacherChild = TeacherChildModel.fromMap(response.data);
      
  return (response.data as List).map((data) => TeacherChildModel.fromMap(data)).toList();

}
else{
  return ErrorModel(errorMessage: "there is a problem");
}
  }
}