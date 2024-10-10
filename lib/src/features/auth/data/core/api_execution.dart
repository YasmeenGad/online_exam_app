import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';

Future<Result<T>> apiExecution<T>({
  required Future<Response<dynamic>> request,
  required T Function(dynamic data) fromJson,
}) async {
  try {
    Response<dynamic> response = await request;

    if (response.statusCode != 200) {
      return Fail(exception: ServerError(response.data['message']));
    }

    return Success(fromJson(response.data));
  } on TimeoutException catch (_) {
    return  Fail(exception: NoInternetException());
  } on SocketException catch (_) {
    return Fail(exception: NoInternetException());
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Fail(exception: NoInternetException());
    } else if (e.type == DioExceptionType.badResponse) {

      return Fail(exception: ServerError(e.message.toString()));
    } else {
      return Fail(exception: ParsingError(
        parsingErrorMessage: "Failed to parse data",
        parsingErrorClassName: "ApiManager",
      ));
    }
  } catch (_) {
    return Fail(exception:(UnknownErrorException(
      unknownErrorMessage: "Unknown error, please try again",
    )));
  }
}
