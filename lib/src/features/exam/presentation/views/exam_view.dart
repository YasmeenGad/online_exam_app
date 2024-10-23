import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            CustomAppBar(appBarTxt: ' Exams', showArrow: true),
            SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return shadowContainer(
                    height: 110,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.exams} ${index + 1}',
                              style: AppStyles.styleMedium16(context),
                            ),
                            Text(
                              '30 Minutes',
                              style: AppStyles.styleRegular13(context)
                                  .copyWith(color: AppColors.blueBaseColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '20 Questions',
                          style: AppStyles.styleRegular13(context)
                              .copyWith(color: AppColors.grayColor),
                        ),
                        Spacer(),
                        Text('Duration: 30 Minutes',
                            style: AppStyles.styleMedium13(context)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
