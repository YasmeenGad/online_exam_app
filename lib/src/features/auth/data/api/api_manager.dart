import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/constants/app_apis.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
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

  Future<SignUpResponse> signUp({required SignUpModel signUpModel}) async {
     Response<dynamic> response = await _dio.post<dynamic>("${AppApis.signUp}", data: signUpModel.toJson());
     return SignUpResponse.fromJson(response.data);
  }
}













// try {
//        Response<dynamic> response = await _dio.post<dynamic>("signUp", data: signUpModel.toJson());
//     if (response.statusCode != 200) {
//         return Failure(ServerErrorException(
//           serverErrorCode: response.statusCode,
//           serverErrorMessage: response.data['message'],
//         ));
//     }
//     return Success(SignUpResponse.fromJson(response.data));
//      } on TimeoutException catch (e) {
//        return Failure(NoInternetException());
//      } on SocketException catch (e) {
//        return Failure(NoInternetException());
//      }
//      on DioException catch (e){
//          if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout){
//            return Failure(NoInternetException());
           
//          }else if(e.type == DioExceptionType.badResponse){
//             return Failure(ServerErrorException(
//               serverErrorCode: e.response?.statusCode,
//               serverErrorMessage: e.response?.data['message'],
//             ));
//          } else{
//            return Failure(ParsingErrorMessage(
//              parsingErrorMessage: "Failed to parse data",
//              parsingErrorClassName: "ApiManager",
//            ));
//          }  
//      } catch (e) {
//        return Failure(UnknownErrorException());
//      }