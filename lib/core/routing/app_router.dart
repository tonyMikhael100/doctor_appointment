import 'package:doctor_appointment/core/routing/routers.dart';
import 'package:doctor_appointment/features/login/presentation/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/presentation/views/on_borading_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoradingScreen());
      case Routers.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
