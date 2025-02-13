import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:online_exam_app/generated/assets.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';

import '../../../../core/di/di.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../questions/domain/entities/isar/exam_score.dart';
import '../../../questions/presentation/cubit/questions_view_model.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsViewModel =
        getIt<QuestionsViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            CustomAppBar(appBarTxt: '${AppLocalizations.of(context)?.results}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: questionsViewModel.getAttemptsWithQuestionCount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('${AppLocalizations.of(context)?.noResultsFound}'));
                  }

                  final attempts = snapshot.data!;
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    shrinkWrap: true,
                    itemCount: attempts.length,
                    itemBuilder: (context, index) {
                      final attempt = attempts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.answerView,
                            arguments: {
                              'attemptId': attempt['attemptId'],
                              'onPressed': () {
                                Navigator.pop(context);
                              },
                            },
                          );
                        },
                        child: shadowContainer(
                          width: 0.5,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesProfit,
                                width: 60,
                                height: 71,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${AppLocalizations.of(context)?.exam} ${index + 1}',
                                          style:
                                              AppStyles.styleMedium16(context),
                                        ),
                                        Text(
                                          '30 ${AppLocalizations.of(context)?.minutes}',
                                          style:
                                              AppStyles.styleRegular13(context),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${attempt['questionCount']} ${AppLocalizations.of(context)?.question}',
                                      style: AppStyles.styleRegular13(context)
                                          .copyWith(color: AppColors.grayColor),
                                    ),
                                    const SizedBox(height: 10),
                                    FutureBuilder<ExamScore>(
                                      future:
                                          questionsViewModel.getScoreStatistics(
                                              attempt['attemptId']),
                                      builder: (context, scoreSnapshot) {
                                        if (scoreSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }
                                        if (scoreSnapshot.hasError) {
                                          return Text('${AppLocalizations.of(context)?.noResultsFound}');
                                        }
                                        final score = scoreSnapshot.data!;
                                        return Text(
                                          '${score.correctAnswers} ${AppLocalizations.of(context)?.correctedAnswers} ${attempt['questionCount']} ${AppLocalizations.of(context)?.question}',
                                          style:
                                              AppStyles.styleMedium13(context)
                                                  .copyWith(
                                                      color: AppColors
                                                          .blueBaseColor),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
