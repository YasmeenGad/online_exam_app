import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class QuestionsCard extends StatelessWidget {
  const QuestionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return shadowContainer(
      width: 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select the correctly punctuated sentence.',
            style: AppStyles.styleMediumInter18(context)
                .copyWith(color: AppColors.blackBaseColor),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 25,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(' Its going to rain today.',
                        style: AppStyles.styleRegular14(context)),
                    leading: Radio<String>(
                      activeColor: AppColors.blueBaseColor,
                      value: 'selectedAnswer',
                      groupValue: 'selectedAnswer',
                      onChanged: (value) {},
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
