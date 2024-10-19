import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_form.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_actions.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/custom_profile_picture.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/profile_form.dart';

import '../../../../core/dependency injection/di.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModel>();
    profileViewModel.doAction(GetProfileData(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MTI5ZmNmM2MwMTliMzMyOTQ3MTM1ZSIsInJvbGUiOiJ1c2VyIiwidXNlciI6eyJ1c2VybmFtZSI6IldhbGFhIiwiZmlyc3ROYW1lIjoiV2FsYWEiLCJsYXN0TmFtZSI6IkFsaSIsImVtYWlsIjoid2FsYUBlbGV2YXRlLmNvbSIsInBob25lIjoiMDEwOTQxNTU3MTEiLCJyb2xlIjoidXNlciIsImlzVmVyaWZpZWQiOmZhbHNlLCJfaWQiOiI2NzEyOWZjZjNjMDE5YjMzMjk0NzEzNWUiLCJjcmVhdGVkQXQiOiIyMDI0LTEwLTE4VDE3OjUwOjA3Ljc3MVoifSwiaWF0IjoxNzI5MjczODA3fQ.45-qgVR4HLpD4bBQlcjvQVFPMDLfv2UGWg8tX9OKyuo",
        context: context));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
        create: (context) => profileViewModel,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
            child: Column(
              children: [
                CustomAppBar(
                    appBarTxt: '${AppLocalizations.of(context)!.profile}'),
                const SizedBox(height: 20),
                const ProfilePic(),
                const SizedBox(height: 20),
                BlocConsumer<ProfileViewModel, ProfileState>(
                  buildWhen: (previous, current) => current is ProfileInitial,
                  builder: (context, state) {
                    return ProfileForm(
                        usernameController: usernameController,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        phoneNumberController: phoneNumberController,
                        formKey: formKey);
                  },
                  listener: (context, state) {
                    switch (state) {
                      case ProfileDataSuccess():
                        {
                          usernameController.text =
                              state.profileDataResponse.user?.username ?? " ";
                          firstNameController.text =
                              state.profileDataResponse.user?.firstName ?? " ";
                          lastNameController.text =
                              state.profileDataResponse.user?.lastName ?? " ";
                          emailController.text =
                              state.profileDataResponse.user?.email ?? " ";
                          phoneNumberController.text =
                              state.profileDataResponse.user?.phone ?? " ";
                        }
                      default:
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
