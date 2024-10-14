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
    return Success(fromJson(response.data));
  } on SocketException {
    return Failure(exception: NoInternetException());
  } on TimeoutException {
    return Failure(exception: NoInternetException(message: "Request Timeout"));
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      return Failure(
          exception: UnauthorizedException(
              message: e.response?.data['message'] ?? "Unauthorized"));
    } else if (e.response?.statusCode == 404) {
      return Failure(
          exception: NotFound(message: e.response?.data['message']));
    }
    
    else if (e.response?.statusCode == 409) {
      return Failure(
          exception: ConflictException(message: e.response?.data['message']));
    } else if (e.response != null && e.response!.statusCode! >= 500) {
      return Failure(
          exception: ServerError(
              message: "Server error", details: e.response!.data.toString()));
    } else {
      return Failure(
          exception: ParsingError(message: "Failed to parse response"));
    }
  } catch (e) {
    return Failure(
        exception:
            UnknownErrorException(message: "Unknown error occurred"));
  }
}
