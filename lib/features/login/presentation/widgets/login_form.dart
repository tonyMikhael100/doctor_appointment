import 'package:doctor_appointment/core/helpers/app_regex.dart';
import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/passowrd_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            backgroundColor: AppColors.moreLightGray,
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Email is invalid';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
              hintText: 'Password',
              backgroundColor: AppColors.moreLightGray,
              controller: context.read<LoginCubit>().passwordController,
              isObsercureText: context.read<LoginCubit>().isObsecureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<LoginCubit>().isObsecureText =
                        !context.read<LoginCubit>().isObsecureText;
                  });
                },
                child: context.read<LoginCubit>().isObsecureText
                    ? Icon(
                        Icons.visibility_off,
                        color: AppColors.mainBlue,
                      )
                    : Icon(
                        Icons.visibility,
                        color: AppColors.mainBlue,
                      ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Password is invalid';
                }
                return null;
              }),
          verticalSpace(16),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot password?',
                style: AppTextSytles.font12Blue400Weight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
