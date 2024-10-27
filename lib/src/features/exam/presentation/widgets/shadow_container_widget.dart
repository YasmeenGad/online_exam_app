import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

Container shadowContainer(
    {required Widget child,
    required double height,
    EdgeInsetsGeometry? padding}) {
  return Container(
    height: height,
    padding: padding,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: AppColors.black30Color.withOpacity(0.5),
          blurRadius: 6,
        ),
      ],
    ),
    clipBehavior: Clip.hardEdge,
    child: child,
  );
}
