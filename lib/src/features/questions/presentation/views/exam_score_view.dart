import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/questions/presentation/widgets/circular_percent.dart';
import 'package:online_exam_app/src/features/questions/presentation/widgets/score_custom.dart';

import '../../../../core/di/di.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/routes/routes_name.dart';
import '../../data/datasource/contracts/offline_datasource/question_offline_datasource.dart';







class ExamScoreView extends StatelessWidget {
  final String correctScore;
  final String incorrectScore;
  final String totalScore;
  final String examId;

  ExamScoreView({
    super.key,
    required this.correctScore,
    required this.incorrectScore,
    required this.totalScore,
    required this.examId,
  });

  @override
  Widget build(BuildContext context) {
    var questionOfflineDataSource = getIt<QuestionsOfflineDatasource>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: CustomAppBar(
          appBarTxt: 'Exam Score',
          showArrow: true,
          navigation: () => Navigator.pushReplacementNamed(context, RoutesName.subjectView),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Your score",
                style: AppStyles.styleMedium18(context),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  CircularPercent(
                    totalScore: totalScore,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScoreCustom(
                          text: 'Correct',
                          number: correctScore,
                          color: AppColors.blueBaseColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScoreCustom(
                          text: 'Incorrect',
                          number: incorrectScore,
                          color: AppColors.errorColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.answerView,
                    arguments: (){
                      Navigator.pushReplacementNamed(context, RoutesName.bottomNavigationBar);


                    },
                  );
                },
                child: CustomButton(
                  txt: 'Show results',
                ),
              ),

              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.questionsView,
                      arguments: examId,
                    );
                  },
                  child: CustomButton(
                    txt: 'Start again',
                    color: AppColors.blueBaseColor,
                    backgroundColor: AppColors.whiteColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

