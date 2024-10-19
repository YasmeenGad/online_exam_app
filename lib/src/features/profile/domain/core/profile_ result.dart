sealed class ProfileResult<T> {}

class Success<T> extends ProfileResult<T> {
  final T? data;

  Success({required this.data});
}

class Failure<T> extends ProfileResult<T> {
  final Exception? exception;

  Failure({required this.exception});
}
