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

}

// final class LoginError extends LoginState {
//   final String message;
//
//   LoginError(this.message);
// }
// final class errorLogin extends LoginState {
//   final AppUser? user;
//
//   errorLogin(this.user);
// }


class LoginError extends LoginState {
  final Exception exception;

  LoginError(this.exception);
}

