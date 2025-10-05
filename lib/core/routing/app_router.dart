import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/core/routing/routers.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/presentation/views/home_screen.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/views/login_screen.dart';
import 'package:doctor_appointment/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctor_appointment/features/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getDoctorSpecializations(),
            child: HomeScreen(),
          ),
        );

      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routers.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routers.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getDoctorSpecializations(),
            child: HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
