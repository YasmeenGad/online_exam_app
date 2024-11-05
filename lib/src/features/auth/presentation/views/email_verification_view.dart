import 'package:flutter/material.dart';

import '../../../../core/global/custom_appbar.dart';
import '../widgets/build_email_verification_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key, required this.email});
  final String email ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
       padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child :CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(appBarTxt: '${AppLocalizations.of(context)!.labelPassword}',showArrow: true,),
            ),
            SliverToBoxAdapter(
              child: BuildEmailVerificationForm(
                email: email,
              ),
            )
          ],
        )
    ),

    );
  }
}
