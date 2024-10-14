class AppException implements Exception {
  final String message;
  final String? details;

  AppException({required this.message, this.details});

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends AppException {
  BadRequestException({String message = "Bad Request"})
      : super(message: message);
}
class UnauthorizedException extends AppException {
  UnauthorizedException({String message = "Unauthorized Access"})
      : super(message: message);
}

class NoInternetException extends AppException {
  NoInternetException({String message = "No Internet Connection"})
      : super(message: message);
}

class ServerError extends AppException {
  ServerError({String message = "Server Error", String? details})
      : super(message: message, details: details);
}
class ConflictException extends AppException {
  ConflictException({String message = "Email or Username already exists"})
      : super(message: message);
}
class NotFound extends AppException {
  NotFound({String message = "There is no account with this email address"})
      : super(message: message);
}

class ParsingError extends AppException {
  ParsingError({String message = "Data Parsing Error"})
      : super(message: message);
}

class UnknownErrorException extends AppException {
  UnknownErrorException({String message = "An unknown error occurred"})
      : super(message: message);
}
