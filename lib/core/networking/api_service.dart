import 'package:dio/dio.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';
import 'package:doctor_appointment/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:doctor_appointment/core/networking/api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  // login
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  // sign up
  @POST(ApiConstants.signup)
  Future<LoginResponse> signup(@Body() SignUpRequestBody signUpRequestBody);

  // home
  @GET(ApiConstants.homeSpeciallization)
  Future<DoctorSpecializationModel> getHomeDoctors();
}
