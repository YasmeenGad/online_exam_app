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



