import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocDocLogo extends StatelessWidget {
  const DocDocLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/docdoc_logo.svg'),
        SizedBox(width: 10.w),
        Text('DocDoc', style: AppTextSytles.font24Black700Weight),
      ],
    );
  }
}
