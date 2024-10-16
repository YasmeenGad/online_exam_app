import 'package:flutter/material.dart';

import '../../../../core/global/custom_appbar.dart';
import '../widgets/build_reset_password_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(appBarTxt: '${AppLocalizations.of(context)!.labelPassword}'),
            ),
            SliverToBoxAdapter(
              child:BuildResetPasswordForm(),
            )
          ],
        ),
      ),

    );
  }
}
