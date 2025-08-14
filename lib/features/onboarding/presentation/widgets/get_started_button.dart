import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStatedButton extends StatelessWidget {
  const GetStatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h, bottom: 20.h),
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          context.pushNamed('/loginScreen');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.mainBlue,
        ),
        child: Text(
          'Get Started',
          style: AppTextSytles.font16WhiteSemiBold,
        ),
      ),
    );
  }
}
