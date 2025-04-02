import 'package:dio/dio.dart';
import 'package:flutter_next_evel/app/constant.dart';
import 'package:flutter_next_evel/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.Apikey)
abstract class AppServiceClient { // Fixed typo in class name
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customers/login") // Fixed typo in endpoint
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}