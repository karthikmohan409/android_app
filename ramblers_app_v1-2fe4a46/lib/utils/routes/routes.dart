import 'package:flutter/material.dart';
import 'package:mississauga/src/auth_screens/view/registration/registration_screen.dart';
import 'package:mississauga/src/auth_screens/view/sign_in_screen.dart';
import 'package:mississauga/src/auth_screens/view/verify_otp_screen.dart';
import 'package:mississauga/src/club_document/view/club_documents.dart';
import 'package:mississauga/src/club_executive/view/club_executive_screen.dart';
import 'package:mississauga/src/club_matches/view/club_matches.dart';
import 'package:mississauga/src/home/view/home_screen.dart';
import 'package:mississauga/src/main_page/view/main_screen.dart';
import 'package:mississauga/src/my_availability/view/my_availability_screen.dart';
import 'package:mississauga/src/my_practice/view/my_practice_screen.dart';
import 'package:mississauga/src/my_schedule/view/my_schedule.dart';
import 'package:mississauga/src/my_stats/screen_my_stats.dart';
import 'package:mississauga/src/payment-history/view/payment_screen.dart';
import 'package:mississauga/src/payment_info/view/payment_info_screen.dart';
import 'package:mississauga/src/splash/splash_screen.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initialScreen:
        return _buildRoute(RoutesName.initialScreen, const SplashScreen());
      case RoutesName.signInScreen:
        return _buildRoute(RoutesName.signInScreen, const SignInScreen());
      case RoutesName.registrationScreen:
        return _buildRoute(
            RoutesName.registrationScreen, const RegistrationScreen());
      case RoutesName.home:
        return _buildRoute(RoutesName.registrationScreen, const HomeScreen());
      case RoutesName.verifyOtpScreen:
        String? otp =
            settings.arguments != null ? settings.arguments.toString() : null;
        return _buildRoute(
            RoutesName.verifyOtpScreen, VerifyOtpScreen(otp: otp));
      case RoutesName.myAvailabilityScreen:
        return _buildRoute(
            RoutesName.verifyOtpScreen, const MyAvailabilityScreen());
      case RoutesName.myPracticeScreen:
        return _buildRoute(
            RoutesName.verifyOtpScreen, const MyPracticeScreen());
      case RoutesName.paymentScreen:
        return _buildRoute(RoutesName.paymentScreen, const PaymentInfoScreen());
      case RoutesName.mainScreen:
        return _buildRoute(RoutesName.verifyOtpScreen, const MainScreen());
      case RoutesName.clubMatchesScreen:
        return _buildRoute(
            RoutesName.clubMatchesScreen, const ClubMatchesScreen());
      case RoutesName.myStatsScreen:
        return _buildRoute(RoutesName.myStatsScreen, const ScreenMyStats());
      case RoutesName.myScheduleScreen:
        return _buildRoute(
            RoutesName.myScheduleScreen, const MyScheduleScreen());
      case RoutesName.clubExecutiveScreen:
        return _buildRoute(
            RoutesName.clubExecutiveScreen, const ClubExecutivesScreen());
      case RoutesName.clubDocumentsScreen:
        return _buildRoute(
            RoutesName.clubDocumentsScreen, const ClubDocumentsScreen());
      case RoutesName.paymentHistoryScreen:
        return _buildRoute(
            RoutesName.paymentHistoryScreen, const PaymentHistoryScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }

  static Route _buildRoute(String route, Widget widget,
      {bool enableFullScreen = false}) {
    return MaterialPageRoute(
        fullscreenDialog: enableFullScreen,
        settings: RouteSettings(name: route),
        builder: (_) => widget);
  }
}
