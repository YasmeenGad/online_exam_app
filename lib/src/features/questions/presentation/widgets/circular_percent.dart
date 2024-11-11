import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// class CircularPercent extends StatelessWidget {
//   const CircularPercent({super.key, required this.totalScore});
//   final String totalScore;
//   @override
//   Widget build(BuildContext context) {
//     return CircularPercentIndicator(
//       radius: 80.0,
//       lineWidth: 10.0,
//       percent: double.parse(totalScore.toString()) / 100,
//       center: Text(
//         totalScore.toString() + "%",
//         style: AppStyles.styleMedium20(context),
//       ),
//       progressColor: AppColors.blueBaseColor,
//       backgroundColor: AppColors.errorColor,
//       circularStrokeCap: CircularStrokeCap.round,
//     );
//   }
// }
class CircularPercent extends StatelessWidget {
  const CircularPercent({super.key, required this.totalScore});
  final String totalScore;

  double _parseTotalScore(String score) {
    try {
      return double.parse(score.replaceAll('%', '').trim()) / 100;
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final parsedScore = _parseTotalScore(totalScore);

    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 10.0,
      percent: parsedScore,
      center: Text(
        "${(parsedScore * 100).toStringAsFixed(2)}%",
        style: AppStyles.styleMedium20(context),
      ),
      progressColor: AppColors.blueBaseColor,
      backgroundColor: AppColors.errorColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
