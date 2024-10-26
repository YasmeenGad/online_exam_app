import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubjectLoadingWidget extends StatelessWidget {
  const SubjectLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Text(
            '${localizations?.survey}',
            style: AppStyles.styleMedium20(context)
                .copyWith(color: AppColors.blueBaseColor),
          ),
          SizedBox(height: 30),
          Text(
            '${localizations?.browseBySubject}',
            style: AppStyles.styleMedium18(context),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              itemBuilder: (context, index) => shadowContainer(
                height: 80,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                        AppLocalizations.of(context)!.loadingItems,

                      style: AppStyles.styleRegular16(context),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }
}
