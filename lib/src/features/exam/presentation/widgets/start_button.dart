import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/routes/routes_name.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.examId});

  final String examId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.questionsView,
            arguments: examId);
      },
      child: CustomButton(
        txt: "${AppLocalizations.of(context)!.start}",
      ),
    );
  }
}
