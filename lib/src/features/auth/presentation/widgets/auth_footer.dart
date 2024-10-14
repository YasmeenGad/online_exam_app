import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({Key? key, required this.question, required this.txt, required this.route}) : super(key: key);
  final String question, txt, route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppStyles.styleRegular14(context).copyWith(
            color: AppColors.blackBaseColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            txt,
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
