import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class ScoreCustom extends StatelessWidget {
  const ScoreCustom(
      {super.key,
      required this.number,
      required this.text,
      required this.color});

  final String number;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        text,
        style: AppStyles.styleMedium16(context).copyWith(color: color),
      ),
      Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1,
            )),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            number.toString(),
            style: AppStyles.styleMedium13(context).copyWith(color: color),
          ),
        ),
      )
    ]);
  }
}
