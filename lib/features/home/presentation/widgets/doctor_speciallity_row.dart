import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class DoctorSpeciallityRow extends StatelessWidget {
  const DoctorSpeciallityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
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
