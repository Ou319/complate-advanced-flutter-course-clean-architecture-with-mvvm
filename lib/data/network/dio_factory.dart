import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_next_evel/app/app_refes.dart';
import 'package:flutter_next_evel/app/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORISATION = "authorisation";
const String DEFAULT_LANGUAGE = "language";



class DioFactory {

  final AppPreference _appPreference;
   DioFactory(this._appPreference);
  Future<Dio> getDio() async{

    Dio dio = Dio();
    
    int _timeout=60*1000;

    String langague =  await _appPreference.getApplangague();
    Map<String,String> headers ={
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORISATION: "send token here",
      DEFAULT_LANGUAGE: langague,
    };
    dio.options=BaseOptions(
      baseUrl: Constant.Apikey,
      headers: headers,
      receiveTimeout: Duration(milliseconds: _timeout),
      connectTimeout: Duration(milliseconds: _timeout),
      
    );  

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
            
            requestHeader : true,
            requestBody : true,
            responseHeader : true,
      ));
    }
      
    return dio;
  }
}