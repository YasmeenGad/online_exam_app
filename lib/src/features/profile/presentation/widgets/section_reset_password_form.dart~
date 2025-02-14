import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_actions.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/reset_password_form.dart';

import '../../../../core/dependency injection/di.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_toast.dart';
import '../../domain/entities/request/change_password_request_entity.dart';
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
            return Column(
              children: [
                ResetPasswordForm(
                    oldPasswordController: oldPasswordController,
                    passwordController: passwordController,
                    rePasswordController: rePasswordController,
                    formKey: formKey),
                const SizedBox(
                  height: 55,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      profileViewModel.doAction(ChangePassword(
                          context: context,
                          request: ChangePasswordRequestEntity(
                              oldPassword: oldPasswordController.text,
                              password: passwordController.text,
                              rePassword: rePasswordController.text)));
                    }
                  },
                  child: CustomButton(
                    txt: '${AppLocalizations.of(context)!.update}',
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {
            switch (state) {
              case ChangePasswordLoading():
                {
                  CustomToast.showLoadingToast(
                      message: "${AppLocalizations.of(context)!.loading}");
                  break;
                }
              case ChangePasswordSuccess():
                {
                  CustomToast.showSuccessToast(
                      message: "${AppLocalizations.of(context)!.success}");
                  break;
                }
              case ChangePasswordError():
                {
                  CustomToast.showErrorToast(
                      message: state.exception.toString());
                  break;
                }
              default:
            }
          },
        ));
  }
}
