import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/custom_profile_picture.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/section_profile_form.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: Column(
          children: [
            CustomAppBar(appBarTxt: AppLocalizations.of(context)!.profile),
            const SizedBox(height: 20),
            const ProfilePic(),
            const SizedBox(height: 20),
            const SectionProfileForm(),
          ],
        ),
      ),
    );
  }
}
