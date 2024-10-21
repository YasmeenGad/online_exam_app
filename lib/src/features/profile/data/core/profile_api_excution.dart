import 'package:dio/dio.dart';
import '../../../auth/domain/core/AppExceptions.dart';
import '../../domain/core/profile_ result.dart';

Future<ProfileResult<T>> apiExecute<T>(
  Future<dynamic> Function() tryCode,
  T Function(dynamic response) domainMapper,
) async {
  try {
    var response = await tryCode();
    return Success(data: domainMapper(response));
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
