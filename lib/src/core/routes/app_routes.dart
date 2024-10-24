import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/welcome_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/login_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/signup_view.dart';
import 'package:online_exam_app/src/features/profile/presentation/views/profile_view.dart';
import 'package:online_exam_app/src/features/profile/presentation/views/reset_password_profile_view.dart';

import '../../features/auth/presentation/views/email_verification_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import 'package:online_exam_app/src/core/global/layout.dart';

import '../../features/exam/presentation/views/exam_view.dart';


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
      RoutesName.profileView: (context) => ProfileView(),
      RoutesName.resetPasswordProfileView: (context) =>
          ResetPasswordProfileView(),
      RoutesName.examView: (context) => ExamView(
        subjectId: ModalRoute.of(context)!.settings.arguments as String,
      ),

    };
  }
}
