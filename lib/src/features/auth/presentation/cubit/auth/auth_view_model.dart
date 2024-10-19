import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/reset_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/usecases/auth_usecase.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';
import '../../../data/api/models/response/email_verification_response.dart';
import '../../../domain/entities/email_verification_entity.dart';
import '../../../domain/entities/reset_password_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@injectable
class AuthViewModel extends Cubit<AuthState> {
  AuthUsecase authUsecase;

  @FactoryMethod()
  AuthViewModel(this.authUsecase) : super(AuthInitialState());

  void signUp(SignUpEntity signUpEntity, BuildContext context) async {
    emit(SignUpLoadingState());
    var result = await authUsecase.signUp(signUpEntity: signUpEntity);
    switch (result) {
      case Success<SignUpResponse>():
        {
          emit(SignUpSuccessState(signUpResponse: result.data));
          break;
        }

      case Failure<SignUpResponse>():
        final exception = result.exception;
        String message;
        if (exception is ConflictException) {
          message = "${AppLocalizations.of(context)?.conflictException}";
          emit(SignUpErrorState(exception: message));
        } else if (exception is NoInternetException) {
          message = "${AppLocalizations.of(context)?.noInternetException}";
          emit(SignUpErrorState(exception: message));
        } else if (exception is ServerError) {
          message = "${AppLocalizations.of(context)?.serverErrorException}";
          emit(SignUpErrorState(exception: message));
        } else {
          message = "${AppLocalizations.of(context)?.unknownErrorException}";
          emit(SignUpErrorState(exception: message));
        }
        break;
    }
  }

  void login(SignInEntity signInEntity, BuildContext context) async {
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
            emit(LoginError(
                exception:
                    "${AppLocalizations.of(context)?.unauthorizedException}"));
          } else if (exception is NoInternetException) {
            emit(LoginError(
                exception:
                    "${AppLocalizations.of(context)?.noInternetException}"));
          } else if (exception is ServerError) {
            emit(LoginError(
                exception:
                    "${AppLocalizations.of(context)?.serverErrorException}"));
          } else {
            emit(LoginError(
                exception:
                    "${AppLocalizations.of(context)?.unknownErrorException}"));
          }
          break;
        }
    }
  }

  void forgetPassword(
      ForgetPasswordEntity forgetPasswordEntity, BuildContext context) async {
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
        {
          final exception = result.exception;
          if (exception is NotFound) {
            emit(ForgetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.notFoundException}"));
          } else if (exception is NoInternetException) {
            emit(ForgetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.noInternetException}"));
          } else if (exception is ServerError) {
            emit(ForgetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.serverErrorException}"));
          } else {
            emit(ForgetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.unknownErrorException}"));
          }
          break;
        }
    }
  }

  void verifyEmail(EmailVerificationEntity emailVerificationEntity,
      BuildContext context) async {
    emit(VerifyEmailLoading());

    var result = await authUsecase.verifyEmail(
        emailVerificationEntity: emailVerificationEntity);

    switch (result) {
      case Success<EmailVerificationResponse>():
        {
          emit(VerifyEmailSuccess(emailVerificationResponse: result.data!));
          break;
        }

      case Failure<EmailVerificationResponse>():
        {
          final exception = result.exception;
          if (exception is BadRequestException) {
            emit(VerifyEmailError(
                exception:
                    "${AppLocalizations.of(context)?.badRequestException}"));
          } else if (exception is NoInternetException) {
            emit(VerifyEmailError(
                exception:
                    "${AppLocalizations.of(context)?.noInternetException}"));
          } else if (exception is ServerError) {
            emit(VerifyEmailError(
                exception:
                    "${AppLocalizations.of(context)?.serverErrorException}"));
          } else {
            emit(VerifyEmailError(
                exception:
                    "${AppLocalizations.of(context)?.unknownErrorException}"));
          }
          break;
        }
    }
  }

  void resetPassword(
      ResetPasswordEntity resetPasswordEntity, BuildContext context) async {
    emit(ResetPasswordLoading());

    var result = await authUsecase.resetPassword(
        resetPasswordEntity: resetPasswordEntity);

    switch (result) {
      case Success<ResetPasswordResponse>():
        {
          emit(ResetPasswordSuccess(resetPasswordResponse: result.data!));
          break;
        }

      case Failure<ResetPasswordResponse>():
        {
          final exception = result.exception;
          if (exception is BadRequestException) {
            emit(ResetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.badRequestException}"));
          } else if (exception is NotFound) {
            emit(ResetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.notFoundException}"));
          } else if (exception is NoInternetException) {
            emit(ResetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.noInternetException}"));
          } else if (exception is ServerError) {
            emit(ResetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.serverErrorException}"));
          } else {
            emit(ResetPasswordError(
                exception:
                    "${AppLocalizations.of(context)?.unknownErrorException}"));
          }
          break;
        }
    }
  }
}
