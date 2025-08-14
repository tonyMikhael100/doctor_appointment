import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/features/onboarding/presentation/widgets/best_doctor_image_and_text.dart';
import 'package:doctor_appointment/features/onboarding/presentation/widgets/doc_doc_logo.dart';
import 'package:doctor_appointment/features/onboarding/presentation/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoradingScreen extends StatelessWidget {
  const OnBoradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
            child: Column(
              children: [
                DocDocLogo(),
                SizedBox(height: 50.h),
                BestDoctorsImageAndText(),
                Text(
                  'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                  textAlign: TextAlign.center,
                  style: AppTextSytles.font14Grey400Weight.copyWith(
                    height: 1.4,
                  ),
                ),
                GetStatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
