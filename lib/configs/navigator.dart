import 'package:chargemod/screens/home_screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../screens/authentication_screens/otp_screen.dart';
import '../screens/authentication_screens/update_profile.dart';
import '../screens/error_screen.dart';
import '../screens/authentication_screens/login_screen.dart';
import '../screens/splash_screen.dart';

class RoutesGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());

      case OtpScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OtpScreen());

      case MainScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MainScreen());

      case ErrorScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ErrorScreen());

      case UpdateProfile.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const UpdateProfile());

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}