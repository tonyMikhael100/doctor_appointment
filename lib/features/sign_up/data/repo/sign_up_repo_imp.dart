import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';
import 'package:doctor_appointment/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_appointment/features/sign_up/data/repo/sign_up_repo.dart';

class SignUpRepoImp implements SignUpRepo {
  final ApiService apiService;

  SignUpRepoImp({required this.apiService});

  @override
  Future<ApiResult<LoginResponse>> signup(
      SignUpRequestBody signUpRequestBody) async {
    try {
      var response = await apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
