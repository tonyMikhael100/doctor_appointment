import 'package:doctor_appointment/core/routing/app_router.dart';
import 'package:doctor_appointment/core/routing/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doctor Appointment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routers.onBoardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
