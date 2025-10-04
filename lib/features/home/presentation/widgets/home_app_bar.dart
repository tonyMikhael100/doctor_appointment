import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Tony ',
              style: AppTextSytles.font18Black700Weight,
            ),
            Text(
              'How are you feeling today?',
              style: AppTextSytles.font11gray400Weight,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.moreLigherGray,
          child: SvgPicture.asset('assets/svg/bill.svg'),
        ),
      ],
    );
  }
}
