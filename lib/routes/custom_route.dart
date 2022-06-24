import 'package:flutter/material.dart';
import 'package:untitled5/registration/view/address_screen.dart';
import 'package:untitled5/registration/view/info_screen.dart';
import 'package:untitled5/registration/view/registration_screen.dart';

class CustomRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'RegistrationScreen':
        return MaterialPageRoute(
          builder: (context) {
            return RegistrationPage();
          },
        );

      case 'InfoScreen':
        return MaterialPageRoute(
          builder: (context) {
            return InfoScreen();
          },
        );
      case 'AddressScreen':
        return MaterialPageRoute(
          builder: (context) {
            return AddressScreen();
          },
        );
    /*  case TakePictureScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return TakePictureScreen(
                camera: settings.arguments as CameraDescription);
          },
        );*/
      default:
        return MaterialPageRoute(
          builder: (context) {
            return RegistrationPage();
          },
        );
    }
  }
}
