import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecillityListViewItem extends StatelessWidget {
  final Doctor doctorModel;

  const DoctorSpecillityListViewItem({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 25,
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
          doctorModel.specialization.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextSytles.font11Black400Weight,
        ),
      ],
    );
  }
}
