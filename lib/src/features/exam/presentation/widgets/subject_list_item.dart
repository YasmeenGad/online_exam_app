import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/exam_argument.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_styles.dart';
import '../../domain/entities/subject_entity.dart';
import 'cached_network_widget.dart';

class SubjectListItem extends StatelessWidget {
  const SubjectListItem({super.key, required this.subject});
  final Subject subject;
  @override
  Widget build(BuildContext context) {
    return   Center(
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
                context, RoutesName.examView,
                arguments: ExamArguments(subjectId: subject.id, subjectImage: subject.icon,));

          },
          leading: CachedNetworkWidget(
            imageUrl: '${subject.icon}',
          ),
          title: Text(
            '${subject.name}',
            style: AppStyles.styleRegular16(context),
          ),
        ),

    );
  }
}
