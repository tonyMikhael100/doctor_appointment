import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestDoctorsImageAndText extends StatelessWidget {
  const BestDoctorsImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svg/big_opacity_logo.svg',
          alignment: Alignment.center,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
            ),
          ),
          child: Image.asset('assets/images/doctor.png'),
        ),
        Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text('Best Doctors\nAppointment App',
                textAlign: TextAlign.center,
                style: AppTextSytles.font32BlueBold)),
      ],
    );
  }
}
