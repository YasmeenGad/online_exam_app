import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamLoadingData extends StatelessWidget {
  const ExamLoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.loadingItems,
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      AppLocalizations.of(context)!.loadingItems,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.loadingItems,
                  ),
                  SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.loadingItems,
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
