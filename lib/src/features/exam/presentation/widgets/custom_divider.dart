import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';

Widget customDivider() {
  return Container(
    width: 2,
    height: 25,
    decoration: BoxDecoration(
      color: AppColors.blue30Color,
      borderRadius: BorderRadius.circular(2),
    )
  );
}
