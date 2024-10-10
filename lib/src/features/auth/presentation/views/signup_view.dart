import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_signup_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSignUpAppBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
                child: Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: usernameController,
                    hintText: 'Enter your user name',
                    labelText: 'User Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        controller: firstNameController,
                        hintText: 'Enter first name',
                        labelText: 'First Name',
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomTextFormField(
                        controller: lastNameController,
                        hintText: 'Enter last name',
                        labelText: 'Last Name',
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Enter your Email',
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        controller: passwordController,
                        hintText: 'Enter password',
                        labelText: 'Passwoed',
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomTextFormField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm password',
                        labelText: 'Password',
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: phoneNumberController,
                    hintText: 'Enter phone number',
                    labelText: 'Phone Number',
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.blueBaseColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: AppStyles.styleMedium16(context)
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppStyles.styleRegular14(context)
                            .copyWith(color: AppColors.blackBaseColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Login",
                              style: AppStyles.styleMedium16(context).copyWith(
                                color: AppColors.blueBaseColor,
                                decoration: TextDecoration.underline,
                              )))
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
