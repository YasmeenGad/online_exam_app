sealed class AuthState{

}

class AuthInitialState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthErrorState extends AuthState{

  final String? message;

  AuthErrorState(this.message);
}

class AuthSuccessState extends AuthState{}