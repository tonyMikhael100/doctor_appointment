import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/core/routing/routers.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/views/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/presentation/views/on_borading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoradingScreen());
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
