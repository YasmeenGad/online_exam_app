import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

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

    return Container();
  }
}
