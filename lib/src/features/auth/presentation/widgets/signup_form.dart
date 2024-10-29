import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/utils/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatefulWidget {
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
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: widget.usernameController,
            hintText: '${AppLocalizations.of(context)!.hintUserName}',
            labelText: '${AppLocalizations.of(context)!.labelUserName}',
            validator: (value) => Validators.validateUserName(value, context),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: widget.firstNameController,
                  hintText: '${AppLocalizations.of(context)!.hintFirstName}',
                  labelText: '${AppLocalizations.of(context)!.labelFirstName}',
                  validator: (value) => Validators.validateFirstName(value, context),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: widget.lastNameController,
                  hintText: '${AppLocalizations.of(context)!.hintLastName}',
                  labelText: '${AppLocalizations.of(context)!.labelLastName}',
                  validator: (value) => Validators.validateLastName(value, context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: widget.emailController,
            hintText: '${AppLocalizations.of(context)!.hintEmail}',
            labelText: '${AppLocalizations.of(context)!.labelEmail}',
            validator: (value) => Validators.validateEmail(value, context),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: widget.passwordController,
                  hintText: '${AppLocalizations.of(context)!.hintPassword}',
                  labelText: '${AppLocalizations.of(context)!.labelPassword}',
                  isPassword: !_isPasswordVisible,
                  validator: (value) =>
                      Validators.validatePassword(value, context),
                  suffix: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: widget.confirmPasswordController,
                  hintText: '${AppLocalizations.of(context)!.hintConfirmPassword}',
                  labelText: '${AppLocalizations.of(context)!.labelConfirmPassword}',
                  isPassword: !_isConfirmPasswordVisible,
                  validator: (value) => Validators.validateConfirmPassword(
                      value, widget.passwordController.text, context),
                  suffix: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: widget.phoneNumberController,
            hintText: '${AppLocalizations.of(context)!.hintPhoneNumber}',
            labelText: '${AppLocalizations.of(context)!.labelPhoneNumber}',
            validator: (value) =>
                Validators.validatePhoneNumber(value, context),
          ),
        ],
      ),
    );
  }
}
