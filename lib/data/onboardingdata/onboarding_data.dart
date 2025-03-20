import 'package:flutter_next_evel/presentation/ressourses/assets_manager.dart';
import 'package:flutter_next_evel/presentation/ressourses/string_manager.dart';

class OnboardingSliderData {
  String title;
  String subtitle;
  String image;

  OnboardingSliderData({required this.title, required this.subtitle, required this.image});
}

List<OnboardingSliderData> OnboardingDataList = [
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
