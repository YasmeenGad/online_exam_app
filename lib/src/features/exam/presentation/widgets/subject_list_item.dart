import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_styles.dart';
import '../../domain/entities/subject_entity.dart';
import 'cached_network_widget.dart';

class SubjectListItem extends StatelessWidget {
  const SubjectListItem({super.key, required this.subject});
  final Subject subject;
  @override
  Widget build(BuildContext context) {
    return  shadowContainer(
      height: 80,
      child: Center(
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
                context, RoutesName.examView,
                arguments: subject.id);
          },
          leading: CachedNetworkWidget(
            imageUrl: '${subject.icon}',
          ),
          title: Text(
            '${subject.name}',
            style: AppStyles.styleRegular16(context),
          ),
        ),
      ),
    );
  }
}
