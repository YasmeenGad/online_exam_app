import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/cached_network_widget.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../domain/entities/exams_entity.dart';
import 'package:intl/intl.dart';

import 'exam_argument.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.exams, required this.subjectImage});

  final Exams exams;
  final String subjectImage;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MM-dd')
        .format(DateTime.parse(exams.createdAt.toString()));
    final formattedTime = DateFormat('HH:mm')
        .format(DateTime.parse(exams.createdAt.toString()));
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutesName.examDetailView,
          arguments: ExamArguments(
            id: exams.id.toString(),
            subjectImage: subjectImage,

          ),
        );
      },
      child: shadowContainer(
          width: 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              CachedNetworkWidget(
                width: 60,
                height: 71,
                imageUrl: subjectImage,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          exams.title.toString(),
                          style: AppStyles.styleMedium16(context),
                        ),
                        Spacer(),
                        Text(
                          '${exams.duration.toString()} ${AppLocalizations.of(context)?.minutes}',
                          style: AppStyles.styleRegular13(context)
                              .copyWith(color: AppColors.blueBaseColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${exams.numberOfQuestions.toString()} ${AppLocalizations.of(context)?.question}",
                      style: AppStyles.styleRegular13(context)
                          .copyWith(color: AppColors.grayColor),
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              '${AppLocalizations.of(context)?.date}: ${formattedDate}',
                              style: AppStyles.styleMedium12(context)),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                              "${AppLocalizations.of(context)?.time}: ${formattedTime}",
                              style: AppStyles.styleMedium12(context)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
