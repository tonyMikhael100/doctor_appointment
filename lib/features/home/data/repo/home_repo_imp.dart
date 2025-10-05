// home repo implementation
import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:doctor_appointment/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});
  @override
  Future<ApiResult<DoctorSpecializationModel>> getHomeDoctors() async {
    try {
      var response = await apiService.getHomeDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
