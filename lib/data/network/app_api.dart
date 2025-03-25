
import 'package:dio/dio.dart';
import 'package:flutter_next_evel/app/constant.dart';
import 'package:flutter_next_evel/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';
@RestApi(baseUrl: Constant.Apikey)
abstract class AppserviseClient{

  factory AppserviseClient(Dio dio, {String baseUrl}) = _AppserviseClient;  
  @POST("/customore/login")

  Future<AuthenticationResponse> login(
    @Field("email") String email,@Field("password") String password
  );
}