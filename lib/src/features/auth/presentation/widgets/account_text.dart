import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';

import '../../../../core/styles/app_styles.dart';

class AccountText extends StatelessWidget {
  AccountText({Key? key,  required this.onPressed,  required this.text,required this.text2}) : super(key: key);
  final void Function()? onPressed;
  final String? text , text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text!,
            style: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.blackBaseColor,
            )),
        InkWell(
          onTap: onPressed,
          child: Text(text2!,
              style: AppStyles.styleMedium16(context).copyWith(
                color: AppColors.blueBaseColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blueBaseColor,
              )),
        ),
      ],
    );
  }
}
