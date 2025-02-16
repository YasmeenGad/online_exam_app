import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/start_button.dart';

class InstructionsExam extends StatelessWidget {
  const InstructionsExam({super.key, required this.examId});

  final String examId;

  @override
  Widget build(BuildContext context) {
    final listOfInstructions = [
      AppLocalizations.of(context)?.instruction1,
      AppLocalizations.of(context)?.instruction2,
      AppLocalizations.of(context)?.instruction3,
      AppLocalizations.of(context)?.instruction4,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.instructions ?? '',
            style: AppStyles.styleMedium18(context),
          ),
          SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10),
            physics: NeverScrollableScrollPhysics(),
            itemCount: listOfInstructions.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) => Text(
              "• ${listOfInstructions[index]}",
              style: AppStyles.styleMedium14(context)
                  .copyWith(color: AppColors.grayColor),
            ),
          ),
          SizedBox(height: 60),
          StartButton(
            examId: examId,
          ),
        ],
      ),
    );
  }
}
