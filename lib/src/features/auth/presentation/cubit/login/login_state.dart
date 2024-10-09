part of 'login_cubit.dart';
sealed class Action{}
class LoginAction extends Action{
  String email;
  String password;
  LoginAction(this.email,this.password);
}
@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AppUser? user;

  LoginSuccess(this.user);

}

class LoginError extends LoginState {
  final Exception? exception;

  LoginError(this.exception);
}

