import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 80.w,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.lightBlue,
                      child: SvgPicture.asset(
                        'assets/svg/doctor_icon.svg',
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                  ),
                ),
                
                verticalSpace(4),
                Text(
                  'Dentist',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextSytles.font11Black400Weight,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
