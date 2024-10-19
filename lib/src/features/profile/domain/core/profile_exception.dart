class AppException implements Exception {
  final String? message;
  final String? details;

  AppException({required this.message, this.details});

  @override
  String toString() {
    return message ?? '';
  }
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message}) : super(message: message);
}

class NoInternetException extends AppException {
  NoInternetException({String? message}) : super(message: message);
}

class ServerError extends AppException {
  ServerError({String? message, String? details})
      : super(message: message, details: details);
}

class UnknownErrorException extends AppException {
  UnknownErrorException({String? message}) : super(message: message);
}
