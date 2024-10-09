import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

Align forgetPasswordText(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: () {},
      child: Text('Forget Password ?',
          style: AppStyles.styleRegular12(context).copyWith(
            color: AppColors.blackBaseColor,
            decoration: TextDecoration.underline,
          )),
    ),
  );
}
