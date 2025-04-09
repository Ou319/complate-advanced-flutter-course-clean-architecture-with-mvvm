import 'package:dartz/dartz.dart';

import 'package:flutter_next_evel/data/data_source/remote_data_source.dart';
import 'package:flutter_next_evel/data/mapper/mapper.dart';
import 'package:flutter_next_evel/data/network/failure.dart';
import 'package:flutter_next_evel/data/network/network_info.dart';
import 'package:flutter_next_evel/data/network/requestes.dart';
import 'package:flutter_next_evel/domain/modele/modeles.dart';
import 'package:flutter_next_evel/domain/repository/reposetory.dart';

class RepositoryImp implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImp(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        // Success
        return Right(response.toDomain());
      } else {
        // Failure from API response
        return Left(Failure(404, "File not found"));
      }
    } else {
      // No internet
      return Left(Failure(404, "Please check your connection settings"));
    }
  }
}
