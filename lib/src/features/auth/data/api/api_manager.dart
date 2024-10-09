import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/models/login_model.dart';
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





}
