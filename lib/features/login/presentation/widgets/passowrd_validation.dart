import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  PasswordValidation({
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasDigit,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
    super.key,
  });
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPasswordValidation(
          text: 'has lowercase letter',
          isValidated: hasLowerCase,
        ),
        buildPasswordValidation(
          text: 'has uppercase letter',
          isValidated: hasUpperCase,
        ),
        buildPasswordValidation(
          text: 'has Digit',
          isValidated: hasDigit,
        ),
        buildPasswordValidation(
          text: 'has special character',
          isValidated: hasSpecialCharacter,
        ),
        buildPasswordValidation(
          text: 'has 8 characters minimum',
          isValidated: hasMinLength,
        ),
      ],
    );
  }

  Row buildPasswordValidation(
      {required String text, required bool isValidated}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.gray,
        ),
        horizontalSpace(10),
        Text(
          text,
          style: isValidated
              ? AppTextSytles.font11gray400Weight.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.mainBlue,
                  decorationThickness: 2,
                )
              : AppTextSytles.font11gray400Weight,
        ),
      ],
    );
  }
}
