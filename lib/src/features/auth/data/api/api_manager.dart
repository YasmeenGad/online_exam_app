import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/constants/app_apis.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/forget_password_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_in_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/email_verification_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/data/core/api_execution.dart';
import 'package:online_exam_app/src/core/network/result.dart';

import 'models/request/email_verification_model.dart';
import 'models/request/reset_password_model.dart';
import 'models/response/reset_password_response.dart';

@singleton
class ApiManager {
  final Dio _dio;

  ApiManager()
      : _dio = Dio(BaseOptions(
    baseUrl: AppApis.baseUrl,
  )) {
    // Add interceptors for logging requests and responses
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) {
        print('api :: $object');
      },
    ));
  }
  Future<Result<SignInResponse>> login({required SignInModel signInModel}) async {
    return apiExecution<SignInResponse>(
      request: _dio.post<dynamic>(
        AppApis.login,
        data: signInModel.toJson(),
      ),
      fromJson: (data) => SignInResponse.fromJson(data),
    );
  }

  Future<Result<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordModel forgetPasswordModel}) async {
    return apiExecution<ForgetPasswordResponse>(
      request: _dio.post<dynamic>(
        AppApis.forgetPassword,
        data: forgetPasswordModel.toJson(),
      ),
      fromJson: (data) => ForgetPasswordResponse.fromJson(data),
    );
  }

  Future<Result<SignUpResponse>> signUp(
      {required SignUpModel signUpModel}) async {
    return apiExecution<SignUpResponse>(
    request: _dio.post<dynamic>(
      "${AppApis.signUp}",
      data: signUpModel.toJson(),
    ),
    fromJson: (data) => SignUpResponse.fromJson(data),
  );

}

  Future<Result<EmailVerificationResponse>>verifyEmail({required EmailVerificationModel emailVerificationModel}) async {
    return apiExecution<EmailVerificationResponse>(
      request: _dio.post<dynamic>(
        AppApis.verifyEmail,
        data: emailVerificationModel.toJson(),
      ),
      fromJson: (data) => EmailVerificationResponse.fromJson(data),
    );
  }

  Future<Result<ResetPasswordResponse>>resetPassword({required ResetPasswordModel resetPasswordModel}) async {
    return apiExecution<ResetPasswordResponse>(
    request: _dio.put<dynamic>(
      AppApis.resetPassword,
      data: resetPasswordModel.toJson(),
    ),
      fromJson: (data) => ResetPasswordResponse.fromJson(data),
    );
  }

}
