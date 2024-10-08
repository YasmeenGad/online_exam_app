import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';


class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.loginView: (context) => const LoginView(),
       RoutesName.forgetPasswordView: (context) => const ForgetPasswordView(),
    };
  }
}
