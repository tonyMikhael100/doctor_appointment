part of 'login_cubit.dart';

@Freezed()
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Sucess<T>;
  const factory LoginState.error({required String error}) = Error;
}
