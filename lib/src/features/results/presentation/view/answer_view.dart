import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import '../../../../core/di/di.dart';
import '../../../../core/global/custom_appbar.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../questions/data/api/models/isar/question_model.dart';
import '../../../questions/presentation/cubit/questions_action.dart';
import '../../../questions/presentation/cubit/questions_view_model.dart';

class AnswerView extends StatelessWidget {
  final String attemptId;
  final VoidCallback? navigation;

  const AnswerView({
    super.key,
    required this.attemptId,
    this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    final questionsViewModel = getIt<QuestionsViewModel>();
    final args = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: CustomAppBar(
          appBarTxt: '${AppLocalizations.of(context)?.answers}',
          showArrow: true,
          navigation: args['navigation'] ?? () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<QuestionModel>>(
        future: questionsViewModel.getAllQuestionsForAttempt(attemptId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('${AppLocalizations.of(context)?.noQuestionsFound}'));
          }

          final questions = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 15),
                    physics: BouncingScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      return shadowContainer(
                        width: 0.5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.questionText,
                              style: AppStyles.styleMediumInter18(context)
                                  .copyWith(color: AppColors.blackBaseColor),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 25),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: question.suggestedAnswers.length,
                              shrinkWrap: true,
                              itemBuilder: (context, ansIndex) {
                                final answer =
                                    question.suggestedAnswers[ansIndex];
                                final answerId = "A${ansIndex + 1}";
                                final isCorrect =
                                    answerId == question.correctAnswer;
                                final isUserAnswer =
                                    answerId == question.userAnswer;

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: isCorrect
                                          ? AppColors.success.withOpacity(0.1)
                                          : isUserAnswer
                                              ? AppColors.errorColor
                                                  .withOpacity(0.1)
                                              : AppColors.lightGray,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isCorrect
                                            ? AppColors.success
                                            : isUserAnswer
                                                ? AppColors.errorColor
                                                : Colors.transparent,
                                      ),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        answer.answerText ?? '',
                                        style: AppStyles.styleRegular14(context)
                                            .copyWith(
                                          color: isCorrect
                                              ? AppColors.success
                                              : isUserAnswer
                                                  ? AppColors.errorColor
                                                  : AppColors.blackBaseColor,
                                        ),
                                      ),
                                      leading: Icon(
                                        isCorrect || isUserAnswer
                                            ? Icons.check_box
                                            : null,
                                        color: isCorrect
                                            ? AppColors.success
                                            : AppColors.errorColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }
}
