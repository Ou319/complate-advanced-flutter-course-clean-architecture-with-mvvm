import 'package:flutter/material.dart';
import 'package:flutter_next_evel/presentation/forgetpassword/forgetpassword_view.dart';
import 'package:flutter_next_evel/presentation/login/login_view.dart';
import 'package:flutter_next_evel/presentation/main/main_view.dart';
import 'package:flutter_next_evel/presentation/register/register_view.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';
import 'package:flutter_next_evel/presentation/splasch/splasch_view.dart';
import 'package:flutter_next_evel/presentation/storedetail/storedetail_view.dart';

class Routes{
  static const String splaschRoutes = "/";
  static const String loginRoutes = "/login";
  static const String registerRoutes = "/regester";
  static const String forgetPasswordRoutes = "/forgetpassword";
  static const String mainhRoutes = "/main";
  static const String storeDetailsRoutes = "/storeDetails";
}

class Routgenarator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splaschRoutes:
        return MaterialPageRoute(builder: (_)=> const SplaschView());
      case Routes.loginRoutes:
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.registerRoutes:
       return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.forgetPasswordRoutes:
        return MaterialPageRoute(builder: (_)=> const ForgetpasswordView());
      case Routes.mainhRoutes:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.storeDetailsRoutes:
        return MaterialPageRoute(builder: (_)=> const StoredetailView());
      default:
        return UndefindRoute();

    }

  }
  static Route<dynamic> UndefindRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(
          child: Center(child: Text(AppString.noRoutfound)), // todo this string to string manager
        ),
      );
    });
  }

}