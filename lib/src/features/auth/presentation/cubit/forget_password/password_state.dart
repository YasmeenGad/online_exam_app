part of 'password_cubit.dart';

@immutable
sealed class PasswordState {}

final class PasswordInitial extends PasswordState {}

class PasswordLoading extends PasswordState {}

class PasswordSuccess extends PasswordState {
  final Password? password;

  PasswordSuccess(this.password);
}


class PasswordError extends PasswordState {
  final Exception? exception;

  PasswordError(this.exception);
}


