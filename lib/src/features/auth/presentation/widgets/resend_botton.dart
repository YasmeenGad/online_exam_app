import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResendBottom extends StatelessWidget {
  const ResendBottom({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${AppLocalizations.of(context)!.dontReceiveCode}",
          style: AppStyles.styleRegular14(context).copyWith(
            color: AppColors.blackBaseColor,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            '${AppLocalizations.of(context)!.resend}',
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
