import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/questions/presentation/widgets/question_argument.dart';

void buildTimeOutDialog(BuildContext context, String examId) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: (5)),
      actionsPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesTimeOut),
            SizedBox(
              width: 10,
            ),
            Text(
              "Time out !!",
              style: AppStyles.styleRegular24(context)
                  .copyWith(color: AppColors.errorColor),
            ),
          ]),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, RoutesName.examScoreView,
                arguments: questionsArguments(
                  correctScore: '10',
                  incorrectScore: '10',
                  totalScore: '50',
                  examId: examId,
                ));
          },
          child: CustomButton(
            txt: "View score",
          ),
        )
      ],
    ),
  );
}
