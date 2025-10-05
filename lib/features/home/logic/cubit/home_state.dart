part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded({
    required DoctorSpecializationModel doctorSpecializationModel,
  }) = Loaded;
  const factory HomeState.error({required String errorMessage}) = Error;
}
