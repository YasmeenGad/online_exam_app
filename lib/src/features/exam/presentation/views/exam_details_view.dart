import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/exam_details_app_bar.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/exam_details_item.dart';
import '../widgets/instructions_exam.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({
    super.key,
    required this.examId, required this.subjectImage,
  });

  final String examId;
  final String subjectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: examDetailsAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ExamDetailsItem(examId: examId, subjectImage: subjectImage),
            SizedBox(height: 15),
            Divider(
              color: AppColors.blue10Color,
              thickness: 1,
            ),
            SizedBox(height: 20),
            InstructionsExam(),
          ],
        ),
      ),
    );
  }
}


