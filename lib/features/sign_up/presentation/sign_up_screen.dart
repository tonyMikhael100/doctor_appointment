import 'package:doctor_appointment/core/helpers/custom_dialog.dart';
import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_appointment/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctor_appointment/features/sign_up/presentation/widgets/create_account_text.dart';
import 'package:doctor_appointment/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateAccountText(),
                verticalSpace(17),
                SignUpForm(),
                verticalSpace(17),
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (error) {
                        CustomDialog.show(
                          context: context,
                          title: 'Error',
                          message: error,
                          confirmText: 'OK',
                        );
                      },
                      success: (data) {
                        context.pop();
                      },
                    );
                  },
                  builder: (context, state) {
                    return TextButton(
                      onPressed: state is Loading
                          ? null
                          : () {
                              signUpMethod(context);
                            },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: state is Loading
                            ? AppColors.gray
                            : AppColors.mainBlue,
                        minimumSize: Size(double.infinity, 52),
                      ),
                      child: state is Loading
                          ? Lottie.asset(
                              'assets/animation/loading_lottie.json',
                              height: 25.h,
                              fit: BoxFit.cover,
                            )
                          : Text(
                              'Sign Up',
                              style: AppTextSytles.font16WhiteSemiBold,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpMethod(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate() &&
        context.read<SignUpCubit>().passwordController.text ==
            context.read<SignUpCubit>().passwordConfirmationController.text) {
      context.read<SignUpCubit>().emitSignUpStates(
            SignUpRequestBody(
              name: context.read<SignUpCubit>().nameController.text,
              email: context.read<SignUpCubit>().emailController.text,
              phone: context.read<SignUpCubit>().phoneController.text,
              gender: '0',
              password: context.read<SignUpCubit>().passwordController.text,
              passwordConfirmation: context
                  .read<SignUpCubit>()
                  .passwordConfirmationController
                  .text,
            ),
          );
      context.read<SignUpCubit>().clearSignupFields();
    }
  }
}
