import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_next_evel/data/onboardingdata/onboarding_data.dart';
import 'package:flutter_next_evel/presentation/onboarding/onboardingpage.dart';
import 'package:flutter_next_evel/presentation/ressourses/color_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/font_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/routes_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/styles_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void _updatePageIndex(int newIndex) {
    setState(() {
      _currentPageIndex = newIndex;
    });

    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppFontsize.s0,
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: OnboardingDataList.length,
        onPageChanged: (value) => _updatePageIndex(value),
        itemBuilder: (context, index) {
          return Onboardingpage(OnboardingDataList[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.darkSecond,
        height: Appsize.a80,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoutes);
                },
                child: Text(
                  AppString.skip,
                  style: getTextStylesubetitle(
                    AppFontsize.s12,
                    FontWhightmanager.regualar,
                    ColorManager.primary,
                  ),
                ),
              ),
            ),
            _getbottomSheet()
          ],
        ),
      ),
    );
  }

  Widget _getbottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //last page
        Padding(
          padding: EdgeInsets.all(PaddingManger.p12),
          child: GestureDetector(
            onTap: () {
              if (_currentPageIndex > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              else{
                child: Icon(Icons.arrow_back_ios, color: ColorManager.black);
              }
            },
            child: Icon(Icons.arrow_back_ios, color: ColorManager.black),
          ),
        ),

        Row(
          children: List.generate(OnboardingDataList.length, (index) {
            return Padding(
              padding: EdgeInsets.all(PaddingManger.p8),
              child: IsthisPage(index),
            );
          }),
        ),

        // next page
        Padding(
          padding: EdgeInsets.all(PaddingManger.p12),
          child: GestureDetector(
            onTap: () {
              if (_currentPageIndex < OnboardingDataList.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacementNamed(context, Routes.loginRoutes);
              }
            },
            child: Icon(Icons.navigate_next_rounded, color: ColorManager.black),
          ),
        ),
      ],
    );
  }

  Widget IsthisPage(int index) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(index == _currentPageIndex),
        width: index == _currentPageIndex ? AppFontsize.s20 : AppFontsize.s16,
        height: AppFontsize.s16,
        decoration: BoxDecoration(
          color: index == _currentPageIndex
              ? ColorManager.primary
              : ColorManager.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
