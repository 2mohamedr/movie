import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/modules/auth/forget_password/forget_password.dart';
import 'package:movies_app/modules/auth/login/login_screen.dart';
import 'package:movies_app/modules/auth/register/register_screen.dart';
import 'package:movies_app/modules/onboarding/onboarding_screen.dart';
import 'package:movies_app/modules/onboarding/start.dart';
import 'package:movies_app/modules/profile/profile_screen.dart';
import 'package:movies_app/modules/splash/splash_screen.dart';

abstract class RoutesPage {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.init:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) => const StartScreens(),
          settings: settings,
        );
      case RoutesName.onboardingContent:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
          settings: settings,
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );
        case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
          settings: settings,
        );
        case RoutesName.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
