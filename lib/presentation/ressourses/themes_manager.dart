import 'package:flutter/material.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/font_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/styles_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // Main colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey,

      // CardView colors
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: AppFontsize.s12,
        shadowColor: ColorManager.grey,
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        elevation: 0,
        titleTextStyle:
            getTextstyle(AppFontsize.s20, FontWhightmanager.bold, Colors.black),
      ),

      // Button theme

      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary,
        textTheme: ButtonTextTheme.primary,
        height: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontsize.s12),
        ),
      ),

      // Text theme

      // Input decoration theme

      inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(PaddingManger.p8),

        //hintstyle
        hintStyle: getTextstyle(
            AppFontsize.s12, FontWhightmanager.regualar, ColorManager.grey),

        // label style

        labelStyle: getTextstyle(
            AppFontsize.s12, FontWhightmanager.regualar, Colors.black),

        // the border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppFontsize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppFontsize.s12),
        ),

        // style error border

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: AppFontsize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppFontsize.s12),
        ),


      ));
}
