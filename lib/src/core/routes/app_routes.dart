import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/welcome_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/login_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/signup_view.dart';

import '../../features/auth/presentation/views/email_verification_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import 'package:online_exam_app/src/core/global/layout.dart';


class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.loginView: (context) => const LoginView(),
      RoutesName.signUpView: (context) => const SignUpView(),
      RoutesName.forgetPasswordView: (context) => const ForgetPasswordView(),
      RoutesName.emailVerificationView: (context) => const EmailVerificationView(),
      RoutesName.resetPasswordView: (context) => const ResetPasswordView(),
      RoutesName.welcomeView: (context) =>  WelcomeView(),
      RoutesName.bottomNavigationBar: (context) =>  Layout(),


    };
  }
}
