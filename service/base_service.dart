import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  late Response response;
       String baseUrl = 'http://192.168.43.93:8000/api/';
      // String baseUrl = 'http://0.0.0.0:8000/api/';
  
   static  const String  imageurl = 'http://192.168.43.93:8000/';
  
}