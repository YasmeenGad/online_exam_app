import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

Center loadingIndicator() {
  return Center(
      child: CircularProgressIndicator(
    color: AppColors.blueBaseColor,
  ));
}
