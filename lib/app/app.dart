import 'package:flutter/material.dart';
import 'package:flutter_next_evel/presentation/ressourses/routes_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/themes_manager.dart';

class MyApp extends StatefulWidget {
  

  // MyApp._internal();

  // static final MyApp _instance = MyApp._internal(); //Singlton or single instance

  // factory MyApp() => _instance;//factory
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routgenarator.getRoute,
      initialRoute: Routes.splaschRoutes,
      theme: getApplicationTheme(),
    );
  }
}