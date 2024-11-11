import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.txt, this.backgroundColor, this.color});
  final String txt;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.blueBaseColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: color ?? AppColors.blueBaseColor,
          width: 1,
        )
        ),
        child: Center(
          child: Text(
            txt,
            style: AppStyles.styleMedium16(context).copyWith(
              color: color ?? AppColors.whiteColor,
            ),
          ),
        ),
      );
  }
}