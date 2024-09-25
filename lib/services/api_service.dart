
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
const bool production = false;
class ApiService{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: production
          ? 'https://app.ifykevents.com/api'
          : 'https://staging-app.ifykevents.com/api',
      headers: {
        'authorization': '97e62c9fb62391d3be9e364706334babac03d334181730c5ac066c316b16db2da6b964e9b3d76cd0365b8caae8af00f400d9772457f30ce44ee583c1feb03e3afbe0c982875557c42c2688ed8ecaf6141f3ccb0adf00b717266e4bdc7965ef12ca77783419b89c837e8821a8de768ee3e3a019af6f6301c1234bfaaf1170f9a9'
      },
    ),
  );

  ApiService(){
    if(kDebugMode){
      _dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true
      ));
    }
  }

  Future<Response> getFeedbacks(){
    try{
      return _dio.get('/reviews');
    } on DioException {
      rethrow;
    }
  }

  Future<Response> submitMessage(String name, String email, String message){
    try{
      return _dio.post(
        '/contact-us',
        data: {
          'name': name,
          'email': email,
          'message': message
        },
      );
    } on DioException {
      rethrow;
    }
  }
}