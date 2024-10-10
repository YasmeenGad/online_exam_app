
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/constants/app_apis.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/data/core/api_execution.dart';
import 'package:online_exam_app/src/features/auth/data/models/login_model.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import '../models/ForgetPasswordRequest.dart';
import 'api_constants.dart';

@singleton
class ApiManager {
  final Dio _dio;

  ApiManager()
      : _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
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
  Future<LoginModel> login(String email, String password) async {
    var apiCall = await _dio.post(ApiConstants.login, data: {
      "email": email,
      "password": password
    });
    return LoginModel.fromJson(apiCall.data);
  }

  Future<ForgetPasswordRequest?> forgetPassword(String email) async {
    var apiCall = await _dio.post(ApiConstants.forgetPassword, data: {
      "email": email,
    });
  return ForgetPasswordRequest.fromJson(apiCall.data);
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
}
