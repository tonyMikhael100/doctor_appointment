import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/failure/failure.dart';
import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/repo/login_repo.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';

class LoginRepoImp implements LoginRepo {
  final ApiService apiService;

  LoginRepoImp({required this.apiService});

  @override
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      var response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
