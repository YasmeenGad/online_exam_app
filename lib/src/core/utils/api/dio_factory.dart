import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class DioFactory {
  DioFactory();

  @factoryMethod
  Dio createDio() {
    Duration timeOut = const Duration(seconds: 60);
    Dio dio = Dio();

    dio.options.connectTimeout = timeOut;
    dio.options.receiveTimeout = timeOut;
    dio.options.validateStatus =
        (status) => status != null && (status == 200 || status == 201);

    dio.interceptors.add(
      !kReleaseMode
          ? PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      )
          : const Interceptor(),
    );

    return dio;
  }
}

