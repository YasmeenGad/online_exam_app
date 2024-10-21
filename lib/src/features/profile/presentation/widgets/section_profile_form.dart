import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/profile_form.dart';

import '../../../../core/dependency injection/di.dart';
import '../cubit/profile_actions.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';

class SectionProfileForm extends StatefulWidget {
  const SectionProfileForm({super.key});

  @override
  State<SectionProfileForm> createState() => _SectionProfileFormState();
}

class _SectionProfileFormState extends State<SectionProfileForm> {
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
    return BlocProvider<ProfileViewModel>(
      create: (context) => profileViewModel,
      child: BlocConsumer<ProfileViewModel, ProfileState>(
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
            emailController.text = state.profileDataResponse.user?.email ?? "";
            phoneNumberController.text =
                state.profileDataResponse.user?.phone ?? "";
          }
        },
      ),
    );
  }
}
