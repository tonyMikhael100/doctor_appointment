import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/Recommended_doctors_list_view.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_sepciality_list_view.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_speciallity_row.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/home_app_bar.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/home_doctor_intro.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/recmmended_doctors_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeAppBar(),
                verticalSpace(35),
                HomeDoctorIntro(),
                verticalSpace(16),
                DoctorSpeciallityRow(),
                verticalSpace(8),
                DoctorSpecialityListView(),
                verticalSpace(24),
                RecmmendedDoctorsRow(),
                verticalSpace(16),
                RecommendedDoctorsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
