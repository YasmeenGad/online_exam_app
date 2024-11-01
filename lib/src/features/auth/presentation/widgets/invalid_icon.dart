import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

Widget InvalidIcon(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        SizedBox(width: 8),
        Text(
          '${AppLocalizations.of(context)!.invalidCode}',
          style: AppStyles.styleRegular13(context).copyWith(color: Colors.red),
        ),
      ],
    ),
  );
}