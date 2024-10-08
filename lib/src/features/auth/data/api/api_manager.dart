import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_response.dart';

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

  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity}) async {
     Response<dynamic> response = await _dio.post<dynamic>("signUp", data: signUpEntity.toJson());
  }
}