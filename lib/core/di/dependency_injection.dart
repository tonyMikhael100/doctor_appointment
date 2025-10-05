import 'package:doctor_appointment/core/networking/api_constants.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/core/networking/dio_factory.dart';
import 'package:doctor_appointment/features/home/data/repo/home_repo_imp.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/login/data/repo/login_repo_imp.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment/features/sign_up/data/repo/sign_up_repo_imp.dart';
import 'package:doctor_appointment/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 🧩 Core
  getIt.registerFactory<ApiService>(
    () => ApiService(DioFactory.getDio(), baseUrl: ApiConstants.apiBaseUrl),
  );

  // 🧱 Login
  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(apiService: getIt()),
  );
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // 🧱 Sign Up
  getIt.registerLazySingleton<SignUpRepoImp>(
    () => SignUpRepoImp(apiService: getIt()),
  );
  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));

  // 🧱 Home
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(apiService: getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
