import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.appBarTxt});
  final String appBarTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Text(
          '${appBarTxt}',
          style: AppStyles.styleMedium20(context)
              .copyWith(color: AppColors.blackBaseColor),
        ),
      ],
    );
  }
}
