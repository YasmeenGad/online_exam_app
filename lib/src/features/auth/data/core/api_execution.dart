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
        serverErrorMessage: response.data['message'],
        serverErrorCode: response.statusCode,
      ));
    }

    return Success(fromJson(response.data));
  } on TimeoutException catch (_) {
    return  Failure(NoInternetException(
      noInternetErrorMessage: "No internet connection, please try again",
    ));
  } on SocketException catch (_) {
    return Failure(NoInternetException(
      noInternetErrorMessage: "No internet connection, please try again",
    ));
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Failure(NoInternetException(
        noInternetErrorMessage: "No internet connection, please try again",
      ));
    } else if (e.type == DioExceptionType.badResponse) {
      print("Raw server response: ${e.response?.data}");
      print("Raw server response: ${e.response?.statusCode}");
      return Failure(ServerErrorException(
        serverErrorCode: e.response?.statusCode,
        serverErrorMessage: e.message,
      ));
    } else {
      return Failure(ParsingErrorMessage(
        parsingErrorMessage: "Failed to parse data",
        parsingErrorClassName: "ApiManager",
      ));
    }
  } catch (_) {
    return Failure(UnknownErrorException(
      unknownErrorMessage: "Unknown error, please try again",
    ));
  }
}
