import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class RecmmendedDoctorsRow extends StatelessWidget {
  const RecmmendedDoctorsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommended Doctors',
          style: AppTextSytles.font18Black700Weight,
        ),
        Text(
          'See All',
          style: AppTextSytles.font12Blue400Weight,
        ),
      ],
    );
  }
}
