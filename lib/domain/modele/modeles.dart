import 'dart:async';

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
class Customore{
  String id;
  String name;
  int numberOfnotification;
  Customore(this.id, this.name, this.numberOfnotification);
}

class Contacts{
  int phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication{
  Customore customore;
  Contacts contacts;
Authentication(this.customore, this.contacts);
}