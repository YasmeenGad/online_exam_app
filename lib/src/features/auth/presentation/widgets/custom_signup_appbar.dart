import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomSignUpAppBar extends StatelessWidget {
  const CustomSignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: AppColors.blackBaseColor,
        ),
        SizedBox(width: 8),
        Text(
          'Sign Up',
          style: AppStyles.styleMedium20(context)
              .copyWith(color: AppColors.blackBaseColor),
        ),
      ],
    );
  }
}
