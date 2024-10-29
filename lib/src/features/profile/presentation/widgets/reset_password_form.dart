import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/core/utils/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';

import '../../../../core/styles/app_colors.dart';
import 'change_text.dart';

class ResetPasswordForm extends StatefulWidget {
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
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            isPassword: !_oldPasswordVisible,
            controller: widget.oldPasswordController,
            hintText: '${AppLocalizations.of(context)!.currentPassword}',
            labelText: '${AppLocalizations.of(context)!.currentPassword}',
            validator: (value) => Validators.validatePassword(value, context),
            suffix: InkWell(
              child: Icon(
                _oldPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _oldPasswordVisible = !_oldPasswordVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: !_newPasswordVisible,
            controller: widget.passwordController,
            hintText: '${AppLocalizations.of(context)!.newPassword}',
            labelText: '${AppLocalizations.of(context)!.newPassword}',
            validator: (value) => Validators.validatePassword(value, context),
            suffix: InkWell(
              child: Icon(
                _newPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _newPasswordVisible = !_newPasswordVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            isPassword: !_confirmPasswordVisible,
            controller: widget.rePasswordController,
            hintText: '${AppLocalizations.of(context)!.confirmPassword}',
            labelText: '${AppLocalizations.of(context)!.confirmPassword}',
            validator: (value) => Validators.validateConfirmPassword(
                value, widget.passwordController.text, context),
            suffix: InkWell(
              child: Icon(
                _confirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onTap: () {
                setState(() {
                  _confirmPasswordVisible = !_confirmPasswordVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
