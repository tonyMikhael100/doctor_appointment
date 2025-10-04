import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_appointment/features/sign_up/data/repo/sign_up_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepoImp) : super(SignUpState.initial());
  final SignUpRepoImp signUpRepoImp;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  void emitSignUpStates(SignUpRequestBody signUpRequestBody) async {
    emit(const SignUpState.loading());
    final response = await signUpRepoImp.signup(signUpRequestBody);
    response.when(
      success: (loginResponse) async {
        emit(SignUpState.success(loginResponse));
      },
      failure: (error) {
        emit(
          SignUpState.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  void clearSignupFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
  }
}
