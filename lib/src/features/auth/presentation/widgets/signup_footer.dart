import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: AppStyles.styleRegular14(context).copyWith(
            color: AppColors.blackBaseColor,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to Login page
          },
          child: Text(
            "Login",
            style: AppStyles.styleMedium16(context).copyWith(
              color: AppColors.blueBaseColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
