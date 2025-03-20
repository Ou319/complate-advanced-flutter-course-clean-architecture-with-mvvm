import 'package:flutter/material.dart';
import 'package:flutter_next_evel/data/onboardingdata/onboarding_data.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/font_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/styles_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/values_manager.dart';

class Onboardingpage extends StatelessWidget {
  final OnboardingSliderData _onboardingData;
   Onboardingpage(this._onboardingData ,{super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: PaddingManger.p34,),
        
        Padding(
          padding: const EdgeInsets.all(PaddingManger.p12),
          child: Text(_onboardingData.title,style: getTextStyleTitle(AppFontsize.s16, FontWhightmanager.medium, ColorManager.darkGrey),),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(PaddingManger.p12),
          child: Text(_onboardingData.subtitle,style: getTextStylelongtext(AppFontsize.s12, FontWhightmanager.regualar, ColorManager.darkGrey),),
        ),
        SizedBox(height: 20,),

        
        Image.asset(_onboardingData.image),
        
      ],
    );
  }
}