import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppTextSytles.font14Grey400Weight,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: AppTextSytles.font12Blue400Weight,
          ),
        )
      ],
    );
  }
}
