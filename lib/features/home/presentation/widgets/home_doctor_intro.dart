import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorIntro extends StatelessWidget {
  const HomeDoctorIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage('assets/images/home_banner.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and \nschedule with \nnearest doctor',
                  style: AppTextSytles.font18White500Weight,
                ),
                verticalSpace(8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                        side: BorderSide.none,
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: AppTextSytles.font12Blue400Weight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: Image.asset('assets/images/home_doctor.png'),
          ),
        ],
      ),
    );
  }
}
