import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_signup_appbar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSignUpAppBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
