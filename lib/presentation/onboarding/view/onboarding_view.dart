import 'package:flutter/material.dart';
import 'package:flutter_next_evel/domain/modeles.dart';
import 'package:flutter_next_evel/presentation/onboarding/viewmodel/onhoarding_viewmodel.dart';
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
  OnhoardingViewmodel _viewmodel = OnhoardingViewmodel();
  

  _bind(){
    _viewmodel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewobject>(
      stream: _viewmodel.outputSliderViewobject, 
      builder: (context,snapshot){
        return _getContentWidget(snapshot.data);
      }
    );
  }

  Widget _getContentWidget(SliderViewobject? data){
    if(data == null) return SizedBox.shrink();
    else{
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppFontsize.s0,
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: data.nbrOfSliders,
        onPageChanged: (value) => _viewmodel.onPagechnged(value),
        itemBuilder: (context, index) {
          return getPageSlider(data.sliderobject);
        },
      ),
      bottomSheet: Container(
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
            _getbottomSheet(data.currentIndex,data.nbrOfSliders),
          ],
        ),
      ),
    );
  }}

   Widget getPageSlider(OnboardingSliderData _onboardingData) {
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

  Widget _getbottomSheet(int _currentPageIndex,lengthElement) {
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
              Icon(Icons.arrow_back_ios, color: ColorManager.black);
              }
            },
            child: Icon(Icons.arrow_back_ios, color: ColorManager.black),
          ),
        ),

        Row(
          children: List.generate(lengthElement, (index) {
            return Padding(
              padding: EdgeInsets.all(PaddingManger.p8),
              child: IsthisPage(index,_currentPageIndex),
            );
          }),
        ),

        // next page
        Padding(
          padding: EdgeInsets.all(PaddingManger.p12),
          child: GestureDetector(
            onTap: () {
              if (_currentPageIndex < lengthElement - 1) {
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

  Widget IsthisPage(int index,_currentPageIndex) {
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
