import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: AppTextSytles.font11gray400Weight,
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: AppTextSytles.font11Black400Weight,
          ),
          TextSpan(
            text: 'and ',
            style: AppTextSytles.font11gray400Weight,
          ),
          TextSpan(
            text: 'PrivacyPolicy',
            style: AppTextSytles.font11Black400Weight,
          ),
        ],
      ),
    );
  }
}
