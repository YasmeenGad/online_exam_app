import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../views/reset_password_profile_view.dart';

class ChangeText extends StatelessWidget {
  const ChangeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, RoutesName.resetPasswordProfileView);

        Navigator.of(context).push(PageAnimationTransition(
            page: ResetPasswordProfileView(),
            pageAnimationType: LeftToRightFadedTransition()));
      },
      child: Text(
        "${AppLocalizations.of(context)!.change}",
        style: AppStyles.styleMedium12(context)
            .copyWith(color: AppColors.blueBaseColor),
      ),
    );
  }
}
