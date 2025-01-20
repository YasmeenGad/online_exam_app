import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class NoQuestionsView extends StatelessWidget {
  final VoidCallback onBackPressed;

  const NoQuestionsView({Key? key, required this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesNoQuestions,
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          Text(
            AppLocalizations.of(context)!.noQuestions,
            textAlign: TextAlign.center,
            style: AppStyles.styleMediumInter18(context),
          ),
          SizedBox(height: 64),
          GestureDetector(
            onTap: onBackPressed,
            child: Container(
              height: 48,
              width: MediaQuery.sizeOf(context).width * 0.5,
              decoration: BoxDecoration(
                color: AppColors.blueBaseColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.back,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
