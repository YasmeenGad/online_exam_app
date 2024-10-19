import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
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
  late final TextEditingController usernameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Initialize the controllers here
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();

    profileViewModel = getIt.get<ProfileViewModel>();
    profileViewModel.doAction(GetProfileData(context: context));
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
          child: Column(
            children: [
              CustomAppBar(appBarTxt: AppLocalizations.of(context)!.profile),
              const SizedBox(height: 20),
              const ProfilePic(),
              const SizedBox(height: 20),
              BlocConsumer<ProfileViewModel, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProfileDataSuccess) {
                    return ProfileForm(
                      usernameController: usernameController,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      phoneNumberController: phoneNumberController,
                      formKey: formKey,
                    );
                  } else if (state is ProfileDataError) {
                    return Center(child: Text(state.exception.toString()));
                  } else {
                    return const SizedBox();
                  }
                },
                listener: (context, state) {
                  if (state is ProfileDataSuccess) {
                    usernameController.text =
                        state.profileDataResponse.user?.username ?? "";
                    firstNameController.text =
                        state.profileDataResponse.user?.firstName ?? "";
                    lastNameController.text =
                        state.profileDataResponse.user?.lastName ?? "";
                    emailController.text =
                        state.profileDataResponse.user?.email ?? "";
                    phoneNumberController.text =
                        state.profileDataResponse.user?.phone ?? "";
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
