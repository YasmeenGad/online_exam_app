import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  const QuestionIndicator({
    Key? key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1} of $totalQuestions",
          style: AppStyles.styleMediumRoboto14(context)
              .copyWith(color: AppColors.grayColor),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (currentQuestionIndex + 1) / totalQuestions,
          backgroundColor: AppColors.grayColor.withOpacity(0.3),
          color: AppColors.blueBaseColor,
          minHeight: 6,
        ),
      ],
    );
  }
}
