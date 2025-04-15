import 'package:flutter/material.dart';
import 'package:flutter_next_evel/app/app.dart';
import 'package:flutter_next_evel/app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppmodule();
  runApp( MyApp());
}

