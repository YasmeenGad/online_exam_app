import 'package:flutter/material.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class ChangeText extends StatelessWidget {
  const ChangeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.resetPasswordProfileView);
      },
      child: Text(
        "Change",
        style: AppStyles.styleMedium12(context)
            .copyWith(color: AppColors.blueBaseColor),
      ),
    );
  }
}
