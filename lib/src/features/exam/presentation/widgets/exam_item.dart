import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../domain/entities/exam_entity.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.exams});

  final Exam exams;

  @override
  Widget build(BuildContext context) {
    return shadowContainer(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                exams.title.toString(),
                style: AppStyles.styleMedium16(context),
              ),
              Text(
                '${exams.duration.toString()} ${AppLocalizations.of(context)?.questions}',
                style: AppStyles.styleRegular13(context)
                    .copyWith(color: AppColors.blueBaseColor),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${exams.numberOfQuestions.toString()} ${AppLocalizations.of(context)?.questions}",
            style: AppStyles.styleRegular13(context)
                .copyWith(color: AppColors.grayColor),
          ),
          Spacer(),
          Text(exams.createdAt.toString(),
              style: AppStyles.styleMedium13(context)),
        ],
      ),
    );
  }
}
