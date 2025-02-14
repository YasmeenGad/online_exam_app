import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

AppBar appBarWidget(
    {required String title, required BuildContext context, required void Function()? onPressed}) {
  {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              IconButton(
              onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackBaseColor,
                ),
              ),
              Text(
                '${title}',
                style: AppStyles.styleMedium20(context)
                    .copyWith(color: AppColors.blackBaseColor),
              ),
            ],
          )
      ),
       automaticallyImplyLeading: false,

    );
  }
}