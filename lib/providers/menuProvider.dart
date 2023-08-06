import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {

  bool family = false;

  bool night = false;

  bool bahman = false;

  void familyBannerOff() {
    this.family = false;
    notifyListeners();
  }

  void familyBannerOn() {
    this.family = true;
    notifyListeners();
  }

  void nightBannerOff() {
    this.night = false;
    notifyListeners();
  }

  void nightBannerOn() {
    this.night = true;
    notifyListeners();
  }

  void bahmanBannerOff() {
    this.bahman = false;
    notifyListeners();
  }

  void bahmanBannerOn() {
    this.bahman = true;
    notifyListeners();
  }

}