import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';


Column forgetPasswordDescription(BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 30),
      Text(
        'Forget Password',
        style: AppStyles.styleMedium18(context),
      ),
      const SizedBox(height: 10),
      Text(
        'Please enter your email associated to your account',
        textAlign: TextAlign.center,
        style: AppStyles.styleRegular14(context).copyWith(
          color: AppColors.grayColor,
        ),
      ),
    ],
  );
}
