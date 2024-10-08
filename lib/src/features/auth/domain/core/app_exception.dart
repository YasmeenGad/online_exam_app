class ParsingErrorMessage implements Exception{
  final String? parsingErrorMessage;
  final String? parsingErrorClassName;
  ParsingErrorMessage({required this.parsingErrorMessage, required this.parsingErrorClassName});
}

class NoInternetException implements Exception{
  final String? noInternetErrorMessage;
  NoInternetException(
    {required this.noInternetErrorMessage}
  );
}

class ServerErrorException implements Exception{
  final String? serverErrorMessage;
  final int? serverErrorCode;
  ServerErrorException({required this.serverErrorMessage, required this.serverErrorCode});
}

class UnknownErrorException implements Exception {
  final String? unknownErrorMessage;
  UnknownErrorException({required this.unknownErrorMessage});
}