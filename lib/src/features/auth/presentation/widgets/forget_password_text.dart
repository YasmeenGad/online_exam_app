import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../views/forget_password_view.dart';

Align forgetPasswordText(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: () {
         Navigator.of(context).pushNamed(ForgetPasswordView.routeName);
      },
      child: Text('Forget Password ?',
          style: AppStyles.styleRegular12(context).copyWith(
            color: AppColors.blackBaseColor,
            decoration: TextDecoration.underline,
          )),
    ),
  );
}
