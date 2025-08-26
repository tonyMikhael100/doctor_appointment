import 'package:doctor_appointment/core/helpers/custom_dialog.dart';
import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/login_form.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/sign_up_text.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/terms_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text(
                  'Welcome Back',
                  style: AppTextSytles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  ' We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppTextSytles.font14Grey400Weight,
                ),
                verticalSpace(36),
                LoginForm(),
                verticalSpace(16),
                BlocConsumer<LoginCubit, LoginState>(
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
                      success: (data) {},
                    );
                  },
                  builder: (context, state) {
                    return TextButton(
                      onPressed: state is Loading
                          ? null
                          : () {
                              if (context
                                  .read<LoginCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                context.read<LoginCubit>().emitLoginStates(
                                      LoginRequestBody(
                                        email: context
                                            .read<LoginCubit>()
                                            .emailController
                                            .text,
                                        password: context
                                            .read<LoginCubit>()
                                            .passwordController
                                            .text,
                                      ),
                                    );
                              }
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
                              height: 30.h,
                              fit: BoxFit.cover,
                            )
                          : Text(
                              'Login',
                              style: AppTextSytles.font16WhiteSemiBold,
                            ),
                    );
                  },
                ),
                verticalSpace(32),
                TermsAndConditionText(),
                verticalSpace(32),
                SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
