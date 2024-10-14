import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';


Column forgetPasswordDescription(BuildContext context,String title, String description) {
  return Column(
    children: [
      const SizedBox(height: 30),
      Text(
        title,
        style: AppStyles.styleMedium18(context),
      ),
      const SizedBox(height: 10),
      Text(
        description,
        textAlign: TextAlign.center,
        style: AppStyles.styleRegular14(context).copyWith(
          color: AppColors.grayColor,
        ),
      ),
    ],
  );
}
