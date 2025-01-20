import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final int value;
  final Color color;

  const ScoreCircle({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.08,
      height: screenWidth * 0.08,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        "$value",
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
