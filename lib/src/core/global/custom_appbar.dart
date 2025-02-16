import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.appBarTxt,
      this.showArrow = false,
      this.navigation});

  final String appBarTxt;
  final bool? showArrow;
  final VoidCallback? navigation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showArrow == true
            ? GestureDetector(
                // onTap: () {
                //   if (navigation != null) {
                //     navigation!();
                //   } else {
                //     Navigator.pop(context);
                //   }
                // },
          onTap: navigation ?? () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackBaseColor,
                ),
              )
            : const SizedBox(),
        Text(
          '${appBarTxt}',
          style: AppStyles.styleMedium20(context)
              .copyWith(color: AppColors.blackBaseColor),
        ),
      ],
    );
  }
}
