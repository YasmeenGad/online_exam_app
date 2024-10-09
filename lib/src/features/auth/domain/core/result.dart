import 'package:dio/dio.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T? data;

  Success(this.data);
}

 class Fail<T> extends Result<T> {
  final Exception? exception;
  final T? message;

  Fail({this.exception, this.message});
}

class ExpiredTokenFailure extends Fail {
  ExpiredTokenFailure(String message) : super(message: message);
}

class ServerFailure extends Fail {
  ServerFailure(String message) : super(message: message);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioErrorType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 0, e.response?.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to API server was canceled');
      case DioErrorType.connectionError:
        return ServerFailure('No Internet connection');
      case DioErrorType.unknown:
        return ServerFailure('Oops, there was an error, please try again');
      default:
        return ServerFailure('An unknown error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later.');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with the server, please try later.');
    } else if ([400, 401, 403].contains(statusCode)) {
      return ServerFailure(response['error']?['message'] ?? 'An error occurred');
    } else {
      return ServerFailure('There was an error, please try again.');
    }
  }
}

