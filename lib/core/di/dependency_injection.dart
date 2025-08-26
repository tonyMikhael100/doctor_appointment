import 'package:doctor_appointment/core/networking/api_constants.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/core/networking/dio_factory.dart';
import 'package:doctor_appointment/features/login/data/repo/login_repo_imp.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio $ Api servie

  getIt.registerLazySingleton<ApiService>(
      () => ApiService(DioFactory.getDio(), baseUrl: ApiConstants.apiBaseUrl));

  getIt.registerLazySingleton<LoginRepoImp>(
      () => LoginRepoImp(apiService: getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
