class ParsingErrorMessage implements Exception{
  final String? parsingErrorMessage;
  final String? parsingErrorClassName;
  ParsingErrorMessage({required this.parsingErrorMessage, required this.parsingErrorClassName});
}

class NoInternetException implements Exception{
}

class ServerErrorException implements Exception{
  final String? serverErrorMessage;
  final int? serverErrorCode;
  ServerErrorException({required this.serverErrorMessage, required this.serverErrorCode});
}

class UnknownErrorException implements Exception {}