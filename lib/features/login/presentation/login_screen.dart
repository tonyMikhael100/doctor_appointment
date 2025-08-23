import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/sign_up_text.dart';
import 'package:doctor_appointment/features/login/presentation/widgets/terms_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsecureText = true;
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                          hintText: 'Email',
                          backgroundColor: AppColors.moreLightGray,
                          controller: emailController),
                      verticalSpace(16),
                      AppTextFormField(
                        hintText: 'Password',
                        backgroundColor: AppColors.moreLightGray,
                        controller: passwordController,
                        isObsercureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: isObsecureText
                              ? Icon(
                                  Icons.visibility_off,
                                  color: AppColors.mainBlue,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: AppColors.mainBlue,
                                ),
                        ),
                      ),
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
                      )
                    ],
                  ),
                ),
                verticalSpace(16),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: AppColors.mainBlue,
                    minimumSize: Size(double.infinity, 52),
                  ),
                  child: Text(
                    'Login',
                    style: AppTextSytles.font16WhiteSemiBold,
                  ),
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
