import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/global/custom_appbar.dart';

class TimerDisplay extends StatelessWidget {
  final String time;

  const TimerDisplay({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppBar(
          showArrow: true,
          appBarTxt: '${AppLocalizations.of(context)!.exam}',
        ),
        Row(
          children: [
            Image.asset(Assets.imagesClock, height: 30, width: 24),
            const SizedBox(width: 8),
            Text(
              time,
              style: AppStyles.styleRegular20(context)
                  .copyWith(color: AppColors.timeColor),
            ),
          ],
        ),
      ],
    );
  }
}
