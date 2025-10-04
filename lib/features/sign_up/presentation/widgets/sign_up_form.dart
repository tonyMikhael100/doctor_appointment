import 'package:doctor_appointment/core/helpers/app_regex.dart';
import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/passowrd_validation.dart';
import 'package:doctor_appointment/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    super.initState();
    // لازم نخزن الرفرنس للـ listener عشان نقدر نشيله
    _passwordListener = () {
      setState(() {});
    };
    // ما نستخدم context هنا مباشرة
  }

  late VoidCallback _passwordListener;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signUpCubit = BlocProvider.of<SignUpCubit>(context);
    signUpCubit.passwordController.addListener(_passwordListener);
  }

  @override
  void dispose() {
    // فقط نشيل الـ listener
    signUpCubit.passwordController.removeListener(_passwordListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            backgroundColor: AppColors.moreLightGray,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'phone number is required';
              }
              return null;
            },
            backgroundColor: AppColors.moreLightGray,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Email is required';
              }
              return null;
            },
            backgroundColor: AppColors.moreLightGray,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Password is required';
              }
              return null;
            },
            isObsercureText: true,
            backgroundColor: AppColors.moreLightGray,
          ),
          verticalSpace(16),
          AppTextFormField(
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: 'Confirm Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Password is required';
              }
              return null;
            },
            isObsercureText: true,
            backgroundColor: AppColors.moreLightGray,
          ),
          verticalSpace(16),
          PasswordValidation(
            hasLowerCase: AppRegex.hasLowerCase(
                context.read<SignUpCubit>().passwordController.text),
            hasUpperCase: AppRegex.hasUpperCase(
                context.read<SignUpCubit>().passwordController.text),
            hasDigit: AppRegex.hasDigit(
                context.read<SignUpCubit>().passwordController.text),
            hasSpecialCharacter: AppRegex.hasSpecialCharacter(
                context.read<SignUpCubit>().passwordController.text),
            hasMinLength: AppRegex.hasMinLength(
                context.read<SignUpCubit>().passwordController.text),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
