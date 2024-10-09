import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/core/AppExceptions.dart';
import '../../domain/core/result.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch(ex){
      return Fail<T>(exception: NoInternetException());
  } on DioException catch (ex) {
    return Fail<T>(exception: DioHttpException(ex));
  } on IOException catch (ex) {
    return Fail<T>(exception: NoInternetException());
  }
}
