import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/subject_list_item.dart';

import '../../domain/entities/subject_entity.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key, required this.subjects});

  final List<Subject> subjects;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
         physics: BouncingScrollPhysics(),
         padding: const EdgeInsets.only(bottom: 20, top: 10),
        itemBuilder: (context, index) => shadowContainer(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 0.5,
          child: SubjectListItem(subject: subjects[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: subjects.length,
      ),
    );
  }
}
