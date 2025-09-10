import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/layout_controller.dart';

import '../../features/auth/bloc/auth_bloc.dart';
import '../../features/auth/ui/forget_password.dart';
import '../../features/auth/ui/login_screen.dart';
import '../../features/auth/ui/register_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/start.dart';
import '../../features/profile/ui/update_profile_screen.dart';
import '../../features/splash/splash_screen.dart';

abstract class RoutesPage {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.init:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.onboarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              StartScreens(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.onboardingContent:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.loginScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const LoginScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.registerScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const RegisterScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.forgetPassword:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ForgetPassword(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.profileScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
      case RoutesName.layoutController:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LayoutController(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );

      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          settings: settings,
        );
    }
  }
}
