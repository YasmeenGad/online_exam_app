import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/features/auth/domain/model/password_model.dart';
import 'package:online_exam_app/src/features/auth/domain/usecases/password_usecase.dart';

import '../../../domain/core/result.dart';

part 'password_state.dart';
@injectable

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit(this.passwordUseCase) : super(PasswordInitial());

  static PasswordCubit get(context) => BlocProvider.of(context);

  final PasswordUseCase passwordUseCase;

  TextEditingController emailController = TextEditingController();
  var forgetFormKey = GlobalKey<FormState>();


  void doAction() {
    _forgetPassword();
  }



  void _forgetPassword() async {
    if (forgetFormKey.currentState!.validate()) {
      emit(PasswordLoading());
          var result =  await passwordUseCase.invoke(emailController.text);

      switch (result) {
        case Success<Password?>():{
          emit(PasswordSuccess(result.data));
          break;
        }
        case Fail<Password?>():{
          emit(PasswordError( result.exception));
          break;
        }

      }
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
}
