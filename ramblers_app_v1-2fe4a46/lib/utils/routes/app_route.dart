import 'package:flutter/material.dart';
import 'package:mississauga/src/auth_screens/view/registration/registration_screen.dart';
import 'package:mississauga/src/edit_profile/screen_edit_profile.dart';
import 'package:mississauga/src/notification_screen/screen_notification.dart';

class AppRoutes {
  static void gotoEditProfile(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenEditProfile(),
    ));
  }

  static void gotoNotificationScreens(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenNotification(),
    ));
  }

  static void popScreen(context) {
    Navigator.of(context).pop();
  }
}
