import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam_app/src/features/auth/domain/core/app_exception.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';

Future<Result<T>> apiExecution<T>({
  required Future<Response<dynamic>> request,
  required T Function(dynamic data) fromJson,
}) async {
  try {
    Response<dynamic> response = await request;

    if (response.statusCode != 200) {
      return Failure(ServerErrorException(
        serverErrorCode: response.statusCode,
        serverErrorMessage: response.data['message'],
      ));
    }

    return Success(fromJson(response.data));
  } on TimeoutException catch (_) {
    return Failure(NoInternetException());
  } on SocketException catch (_) {
    return Failure(NoInternetException());
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Failure(NoInternetException());
    } else if (e.type == DioExceptionType.badResponse) {
      return Failure(ServerErrorException(
        serverErrorCode: e.response?.statusCode,
        serverErrorMessage: e.response?.data['message'],
      ));
    } else {
      return Failure(ParsingErrorMessage(
        parsingErrorMessage: "Failed to parse data",
        parsingErrorClassName: "ApiManager",
      ));
    }
  } catch (_) {
    return Failure(UnknownErrorException());
  }
}
