import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/reset_password_form.dart';

import '../../../../core/dependency injection/di.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';

class SectionResetPasswordForm extends StatefulWidget {
  const SectionResetPasswordForm({super.key});

  @override
  State<SectionResetPasswordForm> createState() =>
      _SectionResetPasswordFormState();
}

class _SectionResetPasswordFormState extends State<SectionResetPasswordForm> {
  late final ProfileViewModel profileViewModel;
  late final TextEditingController oldPasswordController;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    profileViewModel = getIt.get<ProfileViewModel>();
    // profileViewModel.doAction(GetProfileData(context: context));
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
        create: (context) => profileViewModel,
        child: BlocConsumer<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            return ResetPasswordForm(
                oldPasswordController: oldPasswordController,
                passwordController: passwordController,
                rePasswordController: rePasswordController,
                formKey: formKey);
          },
          listener: (context, state) {},
        ));
  }
}
