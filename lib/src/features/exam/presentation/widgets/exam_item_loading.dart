import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExamItemLoading extends StatelessWidget {
  const ExamItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 15),
          physics: BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => shadowContainer(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.loadingItems,
                    ),
                    Text(
                      AppLocalizations.of(context)!.loadingItems,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.loadingItems,
                ),
                Spacer(),
                Text(
                  AppLocalizations.of(context)!.loadingItems,
                ),
              ],
            ),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
