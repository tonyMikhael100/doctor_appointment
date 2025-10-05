import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';

abstract class HomeRepo {
  Future<ApiResult<DoctorSpecializationModel>> getHomeDoctors();
}