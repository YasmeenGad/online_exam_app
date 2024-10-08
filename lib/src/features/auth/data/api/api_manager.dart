import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/constants/app_apis.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/core/api_execution.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

@Singleton()
@Injectable()
class ApiManager {
  var _dio = Dio();

  ApiManager() {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
      logPrint: (object) => print("api" + object.toString()),
    ));
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
