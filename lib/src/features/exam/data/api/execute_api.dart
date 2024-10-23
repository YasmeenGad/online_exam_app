import 'package:dio/dio.dart';
import 'package:online_exam_app/src/core/network/result.dart';

import '../../../auth/domain/core/AppExceptions.dart';

Future<Result<T>> ExecuteApi<T>(
    Future<dynamic> Function() tryCode,
    T Function(dynamic response) domainMapper,
    ) async {
  try {
    var response = await tryCode();
    return Success( domainMapper(response));
  } on DioException catch (e) {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return Failure(
            exception:
            UnauthorizedException(message: e.response!.data['message']));
      } else {
        return Failure(exception: ServerError());
      }
    } else {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.unknown) {
        return Failure(exception: NoInternetException());
      }
      return Failure(exception: UnknownErrorException());
    }
  }
}
