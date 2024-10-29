import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

import '../../../../core/styles/app_styles.dart';

class QuestionCard extends StatelessWidget {
  final QuestionsEntity question;
  final String? selectedAnswer;
  final ValueChanged<String?> onAnswerSelected;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question ?? '',
          style: AppStyles.styleMediumInter18(context)
              .copyWith(color: AppColors.blackBaseColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: question.answers?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final answer = question.answers![index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    answer.answer ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  leading: Radio<String>(
                    activeColor: AppColors.blueBaseColor,
                    value: answer.key!,
                    groupValue: selectedAnswer,
                    onChanged: onAnswerSelected,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
