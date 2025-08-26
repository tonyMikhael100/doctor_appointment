import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.backgroundColor,
    this.isObsercureText,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? backgroundColor;
  final bool? isObsercureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: isObsercureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.lightGray, width: 1.5),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.mainBlue, width: 1.5),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: backgroundColor ?? AppColors.lightGray,
        filled: true,
      ),
      validator: validator,
    );
  }
}
