import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/features/home/home_screen.dart';

import '../../features/auth/presentation/ui/forget_password.dart';
import '../../features/auth/presentation/ui/login_screen.dart';
import '../../features/auth/presentation/ui/register_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/start.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/splash/splash_screen.dart';

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
          builder: (context) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const RegisterScreen(),
          ),
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
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
