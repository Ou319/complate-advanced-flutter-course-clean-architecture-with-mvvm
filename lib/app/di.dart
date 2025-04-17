
import 'package:dio/dio.dart';
import 'package:flutter_next_evel/app/app_refes.dart';
import 'package:flutter_next_evel/data/data_source/remote_data_source.dart';
import 'package:flutter_next_evel/data/network/app_api.dart';
import 'package:flutter_next_evel/data/network/dio_factory.dart';
import 'package:flutter_next_evel/data/network/network_info.dart';
import 'package:flutter_next_evel/data/repository/repository_imp.dart';
import 'package:flutter_next_evel/domain/repository/reposetory.dart';
import 'package:flutter_next_evel/domain/usecase/login_usecase.dart';
import 'package:flutter_next_evel/presentation/login/viewmodel/loginviewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance=GetIt.instance;

Future<void> initAppmodule() async{
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(()=>sharedPrefs);


  //app prefs instance
  instance.registerLazySingleton<AppPreference>(() => AppPreference(instance()),);

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(InternetConnectionChecker.instance),);

  // dio factory instance
  instance.registerLazySingleton<DioFactory>(()=>DioFactory(instance()),);

  Dio dio=await instance<DioFactory>().getDio();

  // app service client instance
  instance.registerLazySingleton<AppServiceClient>(()=>AppServiceClient(dio));

  // remote data source instance

  instance.registerLazySingleton<RemoteDataSourceImpl>(() => RemoteDataSourceImpl(instance<AppServiceClient>()),);

  // repository instance
  instance.registerLazySingleton<Repository>(() => RepositoryImp(instance<NetworkInfo>(), instance<RemoteDataSourceImpl>()),);
}

Future<void> initLoginmodule() async{
  if(!GetIt.I.isRegistered<LoginUsecase>()){
  instance.registerFactory<LoginUsecase>(()=>LoginUsecase(instance<Repository>()));
  instance.registerFactory<Loginviewmodel>(()=>Loginviewmodel(instance<LoginUsecase>()));
  }
}