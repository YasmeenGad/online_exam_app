import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/build_login_form.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(appBarTxt: '${AppLocalizations.of(context)!.login}'),
            ),
            SliverToBoxAdapter(
              child: BuildLoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
