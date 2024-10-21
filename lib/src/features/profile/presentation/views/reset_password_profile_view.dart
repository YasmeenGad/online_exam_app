import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/reset_password_form.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/section_reset_password_form.dart';
import '../../../../core/global/custom_appbar.dart';

class ResetPasswordProfileView extends StatelessWidget {
  const ResetPasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(
                    appBarTxt: '${AppLocalizations.of(context)!.resetPassword}',
                    showArrow: true,
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const SectionResetPasswordForm(),
                  const SizedBox(
                    height: 55,
                  ),
                  CustomButton(
                    txt: '${AppLocalizations.of(context)!.update}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
