import 'dart:async';

import 'package:flutter_next_evel/data/common/freezed_data_class.dart';
import 'package:flutter_next_evel/data/network/failure.dart';
import 'package:flutter_next_evel/domain/usecase/login_usecase.dart';
import 'package:flutter_next_evel/presentation/base/baseviewmodel.dart';

class Loginviewmodel extends Baseviewmodel implements LoginviewmodelInputs, LoginviewmodelOutputs{

  final StreamController _StreamUsernameContrroler = StreamController<
  String>.broadcast();

  final StreamController _StreamPasswordContrroler = StreamController<
  String>.broadcast();

  var loginObject=LoginObject("", "");
  final LoginUsecase loginUsecase;
  Loginviewmodel(this.loginUsecase);

  @override
  void dispose() {
    _StreamPasswordContrroler.close();
    _StreamUsernameContrroler.close();
  }

  @override
  void start() {
    
  }
  
  @override
  SetPassword(String password) {
    inputPassword.add(password);
    loginObject=loginObject.copyWith(password: password);
  }
  
  @override
  SetUsername(String username) {
    inputUsername.add(username);
    loginObject=loginObject.copyWith(username: username);
  }
  
  @override
  Sink get inputPassword => _StreamPasswordContrroler.sink;
  
  @override
  Sink get inputUsername => _StreamUsernameContrroler.sink;
  


  // for Outputs
  @override
  Stream<bool> get isPasswordvalid => _StreamPasswordContrroler.stream.map((password)=>password.isNotEmpty);
  
  @override
  Stream<bool> get isUsernamevalid => _StreamUsernameContrroler.stream.map((username)=>username.isNotEmpty);
  


  //for inputs
  @override
  login() async{
    (await loginUsecase.execute(LoginUseCaseInput(loginObject.username, loginObject.password))).fold(
      ((failer)=>
        {
          print(failer.message)
        }),
        ((data) =>
        {
          print(data.customore.name)
          // handle success
        })
          );
    }
  }



abstract class LoginviewmodelInputs{
  SetUsername(String username);
  SetPassword(String password);
  login();

  Sink get inputUsername;
  Sink get inputPassword;
}

abstract class LoginviewmodelOutputs{
  
  Stream<bool> get isUsernamevalid;
  Stream<bool> get isPasswordvalid;
  
}