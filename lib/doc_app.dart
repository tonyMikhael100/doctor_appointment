import 'package:doctor_appointment/core/helpers/shared_pref_helper.dart';
import 'package:doctor_appointment/core/routing/app_router.dart';
import 'package:doctor_appointment/core/routing/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatefulWidget {
  const DocApp({super.key});

  @override
  State<DocApp> createState() => _DocAppState();
}

class _DocAppState extends State<DocApp> {
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final token = await SharedPrefHelper.instance.getString('userToken');
    setState(() {
      isLoggedIn = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      // Show splash or loading while checking
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doctor Appointment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: isLoggedIn!
            ? Routers.homeScreen
            : Routers.onBoardingScreen,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
