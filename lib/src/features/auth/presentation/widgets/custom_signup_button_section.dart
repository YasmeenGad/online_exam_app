import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomSignupButtonSection extends StatelessWidget {
  const CustomSignupButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.blueBaseColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "Sign Up",
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: AppColors.whiteColor),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: AppColors.blackBaseColor),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Login",
                    style: AppStyles.styleMedium16(context).copyWith(
                      color: AppColors.blueBaseColor,
                      decoration: TextDecoration.underline,
                    )))
          ],
        )
      ],
    );
  }
}
