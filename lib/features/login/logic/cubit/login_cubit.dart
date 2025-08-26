import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';
import 'package:doctor_appointment/features/login/data/repo/login_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepoImp) : super(LoginState.initial());

  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsecureText = true;

  final LoginRepoImp loginRepoImp;
  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await loginRepoImp.login(loginRequestBody);
    response.when(success: (loginResponse) async {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
