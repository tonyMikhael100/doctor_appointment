import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';
import 'package:doctor_appointment/features/sign_up/data/models/sign_up_request_body.dart';

abstract class SignUpRepo {
  Future<ApiResult<LoginResponse>> signup(SignUpRequestBody signUpRequestBody);
}
