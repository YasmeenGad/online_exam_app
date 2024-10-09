import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';

import '../../../domain/core/result.dart';
import '../../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  void doAction() {
    _login();
  }

    void _login() async {
      if (loginFormKey.currentState!.validate()) {
        emit(LoginLoading());
        try {
          var result = await loginUseCase.invoke(
            emailController.text,
            passwordController.text,
          );
          if (result is Success<AppUser?>) {
            if (result.data != null && result.data!.token != null) {
              emit(LoginSuccess());
            } else {
              emit(LoginError(Exception('Incorrect email or password')));
            }
          } else if (result is Fail<AppUser?>) {
            emit(LoginError(Exception(result.message?.message ?? 'An error occurred')));
          }
        } catch (e) {
          emit(LoginError(Exception(e.toString())));
        }
      } else {
        print('Form is not valid');
      }
    }





  String? validEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter your email';
    }
    var emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validPassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'(?=.*[0-9])').hasMatch(password)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'(?=.*[#?!@$%^&*-])').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }
}

