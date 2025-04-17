import 'package:dartz/dartz.dart';
import 'package:flutter_next_evel/data/network/failure.dart';
import 'package:flutter_next_evel/data/network/requestes.dart';
import 'package:flutter_next_evel/domain/modele/modeles.dart';
import 'package:flutter_next_evel/domain/repository/reposetory.dart';
import 'package:flutter_next_evel/domain/usecase/base_usecase.dart';

class LoginUsecase implements BaseUsecase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) {
    return _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput(this.email, this.password);
}