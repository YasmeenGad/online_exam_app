import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/usecases/auth_usecase.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';

@Injectable()
class AuthViewModel extends Cubit<AuthState> {
  AuthUsecase authUsecase;
  @FactoryMethod()
  AuthViewModel(this.authUsecase) : super(AuthInitialState());

  void signUp(SignUpEntity signUpEntity) async {
    emit(SignUpLoadingState());
    var result = await authUsecase.signUp(signUpEntity: signUpEntity);
    switch (result) {
      case Success<SignUpResponse>():
        {
          emit(SignUpSuccessState(signUpResponse: result.data));
          break;
        }

      case Failure<SignUpResponse>():
        {final exception = result.exception;
      if (exception is ConflictException) {
        emit(SignUpErrorState(exception: exception.message));
      } else if (exception is NoInternetException) {
        emit(SignUpErrorState(exception: exception.message));
      } else if (exception is ServerError) {
        emit(SignUpErrorState(exception: exception.message));
      } else {
        emit(SignUpErrorState(exception: "An unknown error occurred"));
      }
      break;}
    }
  }

  void login(SignInEntity signInEntity) async {
  emit(LoginLoading());

  var result = await authUsecase.login(signInEntity: signInEntity);

  switch (result) {
    case Success<SignInResponse>():
      {
        emit(LoginSuccess(signInResponse: result.data!));
        break;
      }
    case Failure<SignInResponse>():
      {
        final exception = result.exception;
        if (exception is UnauthorizedException) {
          emit(LoginError(exception: exception.message));
        } else if (exception is NoInternetException) {
          emit(LoginError(exception: exception.message));
        } else if (exception is ServerError) {
          emit(LoginError(exception: exception.message));
        } else {
          emit(LoginError(exception: "An unknown error occurred"));
        }
        break;
      }
  }
}

  void forgetPassword(ForgetPasswordEntity forgetPasswordEntity) async {
    emit(ForgetPasswordLoading());

    var result = await authUsecase.forgetPassword(
        forgetPasswordEntity: forgetPasswordEntity);

    switch (result) {
      case Success<ForgetPasswordResponse>():
        {
          emit(ForgetPasswordSuccess(forgetPasswordResponse: result.data!));
          break;
        }

      case Failure<ForgetPasswordResponse>():
        {final exception = result.exception;
      if (exception is NotFound) {
        emit(ForgetPasswordError(exception: exception.message));
      } else if (exception is NoInternetException) {
        emit(ForgetPasswordError(exception: exception.message));
      } else if (exception is ServerError) {
        emit(ForgetPasswordError(exception: exception.message));
      } else {
        emit(ForgetPasswordError(exception: "An unknown error occurred"));
      }
      break;}
    }
  }
}
