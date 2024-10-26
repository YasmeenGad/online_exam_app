import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import '';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/app_colors.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Lottie.asset(
            imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.fill,
          ),
          Text(
           title,
            style: AppStyles.styleMedium18(context).copyWith(
              color: AppColors.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
