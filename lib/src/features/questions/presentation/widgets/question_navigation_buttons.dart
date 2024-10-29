import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class QuestionNavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const QuestionNavigationButtons({
    Key? key,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPrevious,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.blueBaseColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.back,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: AppColors.blueBaseColor),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.blueBaseColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.next,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
