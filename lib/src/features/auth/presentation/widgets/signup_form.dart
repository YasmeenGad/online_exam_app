import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';

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
            hintText: 'Enter your user name',
            labelText: 'User Name',
            validator: (value) => Validators.validateUserName(value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: firstNameController,
                  hintText: 'Enter first name',
                  labelText: 'First Name',
                  validator: (value) => Validators.validateFirstName(value),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: lastNameController,
                  hintText: 'Enter last name',
                  labelText: 'Last Name',
                  validator: (value) => Validators.validateLastName(value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: emailController,
            hintText: 'Enter your Email',
            labelText: 'Email',
            validator: (value) => Validators.validateEmail(value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter password',
                  labelText: 'Password',
                  validator: (value) => Validators.validatePassword(value),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  labelText: 'Password',
                  validator: (value) => Validators.validateConfirmPassword(value, passwordController.text),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: phoneNumberController,
            hintText: 'Enter phone number',
            labelText: 'Phone Number',
            validator: (value) => Validators.validatePhoneNumber(value),
          ),
        ],
      ),
    );
  }
}
