import 'package:flutter/material.dart';

import '../../../../core/global/custom_appbar.dart';
import '../widgets/build_email_verification_form.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
       padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child :CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(appBarTxt: 'Password'),
            ),
            SliverToBoxAdapter(
              child: BuildEmailVerificationForm(),
            )
          ],
        )
    ),

    );
  }
}
