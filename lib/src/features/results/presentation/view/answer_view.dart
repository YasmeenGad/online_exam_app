import 'package:flutter/material.dart';
import '../../../../core/global/custom_appbar.dart';
import '../../../../core/styles/app_colors.dart';

import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';

import '../../../../core/styles/app_styles.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({
    super.key,
    this.navigation,
  });

  final VoidCallback? navigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: CustomAppBar(
          appBarTxt: 'Answers',
          showArrow: true,
          navigation: () {
            navigation!();
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15),
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return shadowContainer(
                    height: 400,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
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
                },
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
