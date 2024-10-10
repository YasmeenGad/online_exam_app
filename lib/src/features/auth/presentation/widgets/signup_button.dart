import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth_view_model.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthViewModel authViewModel;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;

  const SignUpButton({
    Key? key,
    required this.formKey,
    required this.authViewModel,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          authViewModel.signUp(SignUpEntity(
            username: usernameController.text.trim(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            rePassword: confirmPasswordController.text.trim(),
            phone: phoneNumberController.text.trim(),
          ));
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.blueBaseColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: AppStyles.styleMedium16(context).copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
