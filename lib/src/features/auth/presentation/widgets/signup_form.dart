import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    Key? key,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: usernameController,
            hintText: '${AppLocalizations.of(context)!.hintUserName}',
            labelText: '${AppLocalizations.of(context)!.labelUserName}',
            validator: (value) => Validators.validateUserName(value, context),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: firstNameController,
                  hintText: '${AppLocalizations.of(context)!.hintFirstName}',
                  labelText: '${AppLocalizations.of(context)!.labelFirstName}',
                  validator: (value) => Validators.validateFirstName(value, context),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: lastNameController,
                  hintText: '${AppLocalizations.of(context)!.hintLastName}',
                  labelText: '${AppLocalizations.of(context)!.labelLastName}',
                  validator: (value) => Validators.validateLastName(value, context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            hintText: '${AppLocalizations.of(context)!.hintEmail}',
            labelText: '${AppLocalizations.of(context)!.labelEmail}',
            validator: (value) => Validators.validateEmail(value, context),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                  hintText: '${AppLocalizations.of(context)!.hintPassword}',
                  labelText: '${AppLocalizations.of(context)!.labelPassword}',
                  validator: (value) => Validators.validatePassword(value,context),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  isPassword: true,
                  controller: confirmPasswordController,
                  hintText: '${AppLocalizations.of(context)!.hintConfirmPassword}',
                  labelText: '${AppLocalizations.of(context)!.labelConfirmPassword}',
                  validator: (value) => Validators.validateConfirmPassword(value, passwordController.text, context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: '${AppLocalizations.of(context)!.hintPhoneNumber}',
            labelText: '${AppLocalizations.of(context)!.labelPhoneNumber}',
            validator: (value) => Validators.validatePhoneNumber(value,context),
          ),
        ],
      ),
    );
  }
}
