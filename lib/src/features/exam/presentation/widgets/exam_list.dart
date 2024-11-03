import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart';

import 'exam_item.dart';

class ExamList extends StatelessWidget {
  const ExamList({super.key, required this.exams, required this.subjectImage});
  final List<Exams> exams;
  final String subjectImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(height: 15),
        physics: BouncingScrollPhysics(),
        itemCount: exams.length,
        itemBuilder: (context, index) =>
            ExamItem(exams: exams[index], subjectImage: subjectImage,),
      ),
    );
  }
}
