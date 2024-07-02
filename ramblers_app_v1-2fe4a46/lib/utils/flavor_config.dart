import 'package:flutter/material.dart';

class FlavorConfig {
  static final FlavorConfig _instance = FlavorConfig._internal();

  factory FlavorConfig() {
    return _instance;
  }

  FlavorConfig._internal();

  String flavor = 'default';
  Color backgroundColor = Colors.white;
  String appBarTitle = 'App';
  String logoAsset = 'assets/images/default_logo.png';

  void setFlavor(String flavor) {
    this.flavor = flavor;
    switch (flavor) {
      case 'patialashahi':
        backgroundColor = Colors.red;
        appBarTitle = 'Patiala Shahi Cricket Association';
        logoAsset = 'assets/images/logo_patiala_shahi.png';
        break;
      case 'blazingBulls':
        backgroundColor = Colors.orange;
        appBarTitle = 'Blazing Bulls';
        logoAsset = 'assets/images/logo_blazing_bulls.png';
        break;
      case 'missisaugaRamblers':
        backgroundColor = Colors.blue;
        appBarTitle = 'Missisauga Ramblers';
        logoAsset = 'assets/images/logo_ramblers.png';
        break;
      case 'victoriaPark':
      default:
        backgroundColor = Colors.green;
        appBarTitle = 'Victoria Park';
        logoAsset = 'assets/images/logo_victoria_park.png';
        break;
    }
  }
}

final flavorConfig = FlavorConfig();
