import 'package:flutter_next_evel/data/network/app_api.dart';
import 'package:flutter_next_evel/data/network/requestes.dart';
import 'package:flutter_next_evel/data/response/responses.dart';

abstract class RemoteDataSource {
 Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {


  AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}