import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:doctor_appointment/features/home/data/repo/home_repo_imp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImp homeRepoImp;
  HomeCubit(this.homeRepoImp) : super(HomeState.initial());

  Future<void> getDoctorSpecializations() async {
    emit(HomeState.loading());
    final response = await homeRepoImp.getHomeDoctors();
    response.when(
      success: (doctorSpecializationModel) {
        emit(
          HomeState.loaded(
            doctorSpecializationModel: doctorSpecializationModel,
          ),
        );
      },
      failure: (error) {
        emit(HomeState.error(errorMessage: error.apiErrorModel.message!));
      },
    );
  }
}
