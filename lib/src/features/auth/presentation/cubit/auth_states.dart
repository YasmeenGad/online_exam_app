import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

sealed class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState<T> extends AuthState {
  final T? exception;

  AuthErrorState({this.exception});
}

class AuthSuccessState extends AuthState {
  final SignUpResponse? signUpResponse;
  AuthSuccessState({this.signUpResponse});
}
