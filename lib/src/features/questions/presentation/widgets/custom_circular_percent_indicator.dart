import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final double percentage;

  const CustomCircularPercentIndicator({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CircularPercentIndicator(
      radius: screenWidth * 0.2,
      lineWidth: screenWidth * 0.025,
      percent: percentage / 100,
      animation: true,
      animationDuration: 1200,
      center: Text(
        "${(percentage).toStringAsFixed(1)}%",
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      progressColor: AppColors.blueBaseColor,
      backgroundColor: AppColors.errorColor,
    );
  }
}
