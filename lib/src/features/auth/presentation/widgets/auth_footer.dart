import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({Key? key, required this.question, required this.txt, required this.route}) : super(key: key);
  final dynamic question, txt, route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppStyles.styleRegular14(context).copyWith(
            color: AppColors.blackBaseColor,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, route);
            Navigator.of(context).push(PageAnimationTransition(
                page: route, pageAnimationType: BottomToTopFadedTransition()));
          },
          child: Text(
            txt,
            style: AppStyles.styleMedium16(context).copyWith(
              color: AppColors.blueBaseColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
