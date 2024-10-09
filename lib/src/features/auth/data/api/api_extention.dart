import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/core/AppExceptions.dart';
import '../../domain/core/result.dart';

// Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
//   try {
//     var result = await apiCall.call();
//     return Success(result);
//   } on TimeoutException {
//     return Fail<T>(exception: NoInternetException());
//   } on DioException catch (ex) {
//     return Fail<T>(exception: DioHttpException(ex), );
//   } on IOException {
//     return Fail<T>(exception: NoInternetException());
//   } catch (e) {
//     return Fail<T>(exception: Exception('Unknown error occurred'));
//   }
// }

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException {
    return Fail<T>(exception: NoInternetException());
  } on DioException catch (ex) {
    String errorMessage = 'An unknown error occurred';

    if (ex.response != null) {
      if (ex.response!.statusCode == 404) {
        errorMessage = ex.response!.data['message'] ?? 'There was a problem with your request.';
      } else if (ex.response!.data != null) {
        errorMessage = ex.response!.data['message'] ?? 'An unknown error occurred';
      }
    }

    return Fail<T>(exception: ServerError(errorMessage));
  } on IOException {
    return Fail<T>(exception: NoInternetException());
  } catch (e) {
    return Fail<T>(exception: Exception('An unknown error occurred.'));
  }
}
