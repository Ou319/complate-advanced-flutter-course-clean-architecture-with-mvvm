class OnboardingSliderData {
  String title;
  String subtitle;
  String image;

  OnboardingSliderData({required this.title, required this.subtitle, required this.image});
}


class SliderViewobject {
  OnboardingSliderData sliderobject;
  int nbrOfSliders;
  int currentIndex;

  SliderViewobject({
    required this.sliderobject,
    required this.nbrOfSliders,
    required this.currentIndex,
  });
}



//login modeles