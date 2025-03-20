import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_evel/presentation/ressourses/assets_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/routes_manager.dart';

class SplaschView extends StatefulWidget {
  const SplaschView({super.key});

  @override
  State<SplaschView> createState() => _SplaschViewState();
}

class _SplaschViewState extends State<SplaschView> {
  Timer? _timer;


  // make function for timing get function for next page
  _startDeley(){
    _timer=Timer( const Duration(seconds: 3), _goNext);
  }

  // the function for go to next page
 _goNext() {
    Navigator.pushReplacementNamed(context, Routes.OnboadingRoutes);
  }

  // this for start timing
  @override
  void initState() {
    super.initState();
    _startDeley(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Container(
          width: 200,
          child: Image.asset(ImageAssets.splashLogo),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}