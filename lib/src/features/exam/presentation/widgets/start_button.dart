import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/global/custom_button.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
      onTap: () {},
      child: CustomButton(
        txt: "${AppLocalizations.of(context)!.start}",
      ),
    );
  }
}
