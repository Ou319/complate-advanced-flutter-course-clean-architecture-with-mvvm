import 'dart:async';

import 'package:flutter_next_evel/domain/modeles.dart';
import 'package:flutter_next_evel/presentation/base/baseviewmodel.dart';
import 'package:flutter_next_evel/presentation/ressourses/assets_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';

class OnhoardingViewmodel extends Baseviewmodel implements OnhoardingViewmodelInputs , OnhoardingViewmodelOutputs{
  StreamController _streamController=StreamController<SliderViewobject>();
  int _currentPageIndex = 0;
  late final List<OnboardingSliderData> _onboardingDataList;//List<OnboardingSliderData> OnboardingDataList

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _onboardingDataList = _getSliderdata();
    _postdataview();
  }
  
  @override
  int goNext() {
    int nextindex = _currentPageIndex++;
    if(nextindex == _onboardingDataList.length){
      return nextindex=0;
    }
    return nextindex;
  }
  
  @override
  int goPrevious() {
    int previndex = _currentPageIndex--;
    if(previndex == -1){
      return previndex=_onboardingDataList.length-1;
    }
    return previndex;
  }
  
  @override
  void onPagechnged(int index) {
    _currentPageIndex = index;
    _postdataview();
  }
  
  @override
  Sink get inputSliderViewobject => _streamController.sink;
  
  @override
  Stream<SliderViewobject> get outputSliderViewobject => _streamController.stream.map((event)=>event);
  
  //onboarding privat function
  
  void _postdataview(){
    inputSliderViewobject.add(
      SliderViewobject(
        sliderobject: _onboardingDataList[_currentPageIndex],
        nbrOfSliders: _onboardingDataList.length,
        currentIndex: _currentPageIndex,
      )
    );
  }


  List<OnboardingSliderData> _getSliderdata() => [
  OnboardingSliderData(
    title: AppString.OnboardingTitle1,
    subtitle: AppString.Onboardingsuptitle1,
    image: ImageAssets.onboardingImage1,
  ),
  OnboardingSliderData(
    title: AppString.OnboardingTitle2,
    subtitle: AppString.Onboardingsuptitle2,
    image: ImageAssets.onboardingImage2,
  ),
  OnboardingSliderData(
    title: AppString.OnboardingTitle3,
    subtitle: AppString.Onboardingsuptitle3,
    image: ImageAssets.onboardingImage3,
  ),
  OnboardingSliderData(
    title: AppString.OnboardingTitle4,
    subtitle: AppString.Onboardingsuptitle4,
    image: ImageAssets.onboardingImage4,
  ),
];

  
}

abstract class OnhoardingViewmodelInputs{
   int goNext();
   int goPrevious();
   void onPagechnged(int index);

   // stream controller input

   Sink get inputSliderViewobject;
}
abstract class OnhoardingViewmodelOutputs{
  Stream<SliderViewobject> get outputSliderViewobject;
}