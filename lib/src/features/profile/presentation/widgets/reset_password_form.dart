import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/core/utils/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';

import '../../../../core/styles/app_colors.dart';
import 'change_text.dart';

class ResetPasswordForm extends StatelessWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final GlobalKey<FormState> formKey;

  const ResetPasswordForm({
    Key? key,
    required this.oldPasswordController,
    required this.passwordController,
    required this.rePasswordController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            isPassword: true,
            controller: oldPasswordController,
            hintText: '${AppLocalizations.of(context)!.currentPassword}',
            labelText: '${AppLocalizations.of(context)!.currentPassword}',
            validator: (value) => Validators.validatePassword(value, context),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: true,
            controller: passwordController,
            hintText: '${AppLocalizations.of(context)!.newPassword}',
            labelText: '${AppLocalizations.of(context)!.newPassword}',
            validator: (value) => Validators.validatePassword(value, context),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: true,
            controller: rePasswordController,
            hintText: '${AppLocalizations.of(context)!.confirmPassword}',
            labelText: '${AppLocalizations.of(context)!.confirmPassword}',
            validator: (value) => Validators.validateConfirmPassword(
                value, passwordController.text, context),
          ),
        ],
      ),
    );
  }
}
