import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

import '../../../../core/routes/routes_name.dart';
import '../widgets/custom_circular_percent_indicator.dart';
import '../widgets/score_circle.dart';
import '../widgets/score_row.dart';

class ExamScoreView extends StatelessWidget {
  final int correctAnswers;
  final int incorrectAnswers;
  final double percentage;
  final String examId;

  const ExamScoreView({
    Key? key,
    required this.examId,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.07,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(appBarTxt: 'Exam Score', showArrow: true),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: screenHeight * 0.05),
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Score',
                  style: AppStyles.styleMediumInter18(context).copyWith(
                    color: AppColors.blackBaseColor,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: screenHeight * 0.03),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCircularPercentIndicator(percentage: percentage),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScoreRow(
                          label: 'Correct', color: AppColors.blueBaseColor),
                      SizedBox(height: screenHeight * 0.02),
                      ScoreRow(label: 'Incorrect', color: AppColors.errorColor),
                    ],
                  ),
                  Column(
                    children: [
                      ScoreCircle(
                          value: correctAnswers,
                          color: AppColors.blueBaseColor),
                      SizedBox(height: screenHeight * 0.01),
                      ScoreCircle(
                          value: incorrectAnswers, color: AppColors.errorColor),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: screenHeight * 0.1),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.answerView,
                          );
                      },
                      child: CustomButton(txt: 'Show Results')),
                  SizedBox(height: screenHeight * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesName.questionsView,
                          arguments: examId);
                    },
                    child: CustomButton(
                      txt: 'Try Again',
                      color: AppColors.whiteColor,
                      textColor: AppColors.blueBaseColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class ExamScoreView extends StatelessWidget {
//   final int correctAnswers;
//   final int incorrectAnswers;
//   final double percentage;
//   final String examId;
//   final String attemptId;
//
//   const ExamScoreView({
//     Key? key,
//     required this.examId,
//     required this.attemptId,
//     required this.correctAnswers,
//     required this.incorrectAnswers,
//     required this.percentage,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: screenHeight * 0.07,
//           left: screenWidth * 0.05,
//           right: screenWidth * 0.05,
//         ),
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: CustomAppBar(appBarTxt: 'Exam Score', showArrow: true),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(height: screenHeight * 0.05),
//             ),
//             SliverToBoxAdapter(
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Your Score',
//                   style: AppStyles.styleMediumInter18(context).copyWith(
//                     color: AppColors.blackBaseColor,
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(height: screenHeight * 0.03),
//             ),
//             SliverToBoxAdapter(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   CustomCircularPercentIndicator(percentage: percentage),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ScoreRow(
//                           label: 'Correct', color: AppColors.blueBaseColor),
//                       SizedBox(height: screenHeight * 0.02),
//                       ScoreRow(label: 'Incorrect', color: AppColors.errorColor),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       ScoreCircle(
//                           value: correctAnswers,
//                           color: AppColors.blueBaseColor),
//                       SizedBox(height: screenHeight * 0.01),
//                       ScoreCircle(
//                           value: incorrectAnswers, color: AppColors.errorColor),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(height: screenHeight * 0.1),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacementNamed(
//                           context, RoutesName.answerView,
//                         );
//                       },
//                       child: CustomButton(txt: 'Show Results')),
//                   SizedBox(height: screenHeight * 0.03),
//                   GestureDetector(
//                     onTap: () {
//                       String newAttemptId = Uuid().v4();
//
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => QuestionsView(
//                             examId: examId,
//                             //   attemptId: newAttemptId,  // Pass the new attemptId
//                           ),
//                         ),
//                       );
//                     },
//                     child: CustomButton(
//                       txt: 'Try Again',
//                       color: AppColors.whiteColor,
//                       textColor: AppColors.blueBaseColor,
//                     ),
//                   ),
//
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     // Navigator.pushReplacementNamed(
//                   //     //     context, RoutesName.questionsView,
//                   //     //     arguments:  examId,  attemptId
//                   //     // );
//                   //     Navigator.pushReplacement (
//                   //       context,
//                   //       MaterialPageRoute(
//                   //         builder: (context) => QuestionsView(
//                   //           examId: examId,
//                   //           attemptId: attemptId,
//                   //         ),
//                   //       ),
//                   //     );
//                   //   },
//                   //   child: CustomButton(
//                   //     txt: 'Try Again',
//                   //     color: AppColors.whiteColor,
//                   //     textColor: AppColors.blueBaseColor,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }