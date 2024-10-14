import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

sealed class AuthState {}

class AuthInitialState extends AuthState {}


class SignUpLoadingState extends AuthState {}
class SignUpErrorState<T> extends AuthState {
  final T? exception;
  SignUpErrorState({this.exception});
}
class SignUpSuccessState extends AuthState {
  final SignUpResponse? signUpResponse;
  SignUpSuccessState({this.signUpResponse});
}


final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordSuccess extends AuthState {
  final ForgetPasswordResponse forgetPasswordResponse;
  ForgetPasswordSuccess({required this.forgetPasswordResponse});
} 
final class ForgetPasswordError<T> extends AuthState {
  T exception;
  ForgetPasswordError({required this.exception});
}



final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final SignInResponse signInResponse;
  LoginSuccess({required this.signInResponse});
}
class LoginError<T> extends AuthState {
  T exception;
  LoginError({required this.exception});
}
