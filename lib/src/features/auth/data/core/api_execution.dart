import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/core/network/result.dart';

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
    return Failure(exception: NoInternetException());
  } on DioException catch (e) {
    if (e.type == DioErrorType.connectionError) {
      return Failure(exception: NoInternetException());
    } else if (e.response?.statusCode == 400) {
      return Failure(
          exception: BadRequestException(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 401) {
      return Failure(
          exception:
              UnauthorizedException(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 404) {
      return Failure(exception: NotFound(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 409) {
      return Failure(
          exception: ConflictException(message: e.response?.data['message']));
    } else if (e.response != null && e.response!.statusCode! >= 500) {
      return Failure(
          exception: ServerError(details: e.response!.data.toString()));
    } else {
      return Failure(exception: ParsingError());
    }
  } catch (e) {
    return Failure(exception: UnknownErrorException());
  }
}
