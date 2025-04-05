import 'package:dartz/dartz.dart';
import 'package:flutter_next_evel/data/network/failure.dart';
import 'package:flutter_next_evel/data/network/requestes.dart';
import 'package:flutter_next_evel/domain/modele/modeles.dart';

abstract class Repository {
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}