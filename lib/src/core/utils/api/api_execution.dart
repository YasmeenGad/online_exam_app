import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../features/auth/domain/core/AppExceptions.dart';
import '../errors/result.dart';

Future<Result<T>> apiExecute<T>(
    {required Future<dynamic> Function() tryCode,
    required T Function(dynamic response) domainMapper}) async {
  try {
    var response = await tryCode();
    return Success(data: domainMapper(response));
  } on SocketException {
    return Failure(exception: NoInternetException());
  } on DioException catch (e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return Failure(
              exception:
                  BadRequestException(message: e.response!.data['message']));
        case 401:
          return Failure(
              exception:
                  UnauthorizedException(message: e.response!.data['message']));
        case 404:
          return Failure(
              exception: NotFound(message: e.response!.data['message']));
        case 409:
          return Failure(
              exception:
                  ConflictException(message: e.response!.data['message']));
        default:
          if (e.response!.statusCode! >= 500) {
            return Failure(
                exception: ServerError(details: e.response!.data.toString()));
          } else {
            return Failure(exception: UnknownErrorException());
          }
      }
    } else {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        return Failure(exception: NoInternetException());
      }
      return Failure(exception: UnknownErrorException());
    }
  } catch (e) {
    return Failure(exception: UnknownErrorException());
  }
}
