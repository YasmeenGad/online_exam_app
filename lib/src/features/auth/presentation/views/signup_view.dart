import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/core/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/domain/core/app_exception.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth_states.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth_view_model.dart';
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

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AuthViewModel authViewModel = getIt.get<AuthViewModel>();

    return BlocProvider<AuthViewModel>(
      create: (context) => authViewModel,
      child: Scaffold(
        body: BlocConsumer<AuthViewModel, AuthState>(
          listener: (context, state) {
            switch (state) {
              case AuthLoadingState():
                {
                  CustomToast.showLoadingToast(message: "Loading...");

                  break;
                }
              case AuthErrorState():
                var exception = state.exception;
                var message = "Something went wrong";

                if (exception is NoInternetException) {
                  message = exception.noInternetErrorMessage.toString();
                } else if (exception is ServerErrorException) {
                  message = exception.serverErrorMessage.toString();
                } else if (exception is UnknownErrorException) {
                  message = exception.unknownErrorMessage.toString();
                }

                {
                  CustomToast.showErrorToast(message: message);
                  break;
                }
              case AuthSuccessState():
                {
                  CustomToast.showSuccessToast(message: "Success");
                  break;
                }
              default:
            }
          },
          buildWhen: (previous, current) => current is AuthInitialState,
          builder: (context, state) {
            switch (state) {
              case AuthInitialState():
              default:
                {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 56, left: 16, right: 16),
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
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: usernameController,
                                hintText: 'Enter your user name',
                                labelText: 'User Name',
                                validator: (value) =>
                                    Validators.validateUserName(value),
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
                                    validator: (value) =>
                                        Validators.validateFirstName(value),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: CustomTextFormField(
                                    controller: lastNameController,
                                    hintText: 'Enter last name',
                                    labelText: 'Last Name',
                                    validator: (value) =>
                                        Validators.validateLastName(value),
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
                                validator: (value) =>
                                    Validators.validateEmail(value),
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
                                    validator: (value) =>
                                        Validators.validatePassword(value),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: CustomTextFormField(
                                    controller: confirmPasswordController,
                                    hintText: 'Confirm password',
                                    labelText: 'Password',
                                    validator: (value) =>
                                        Validators.validateConfirmPassword(
                                            value, passwordController.text),
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
                                validator: (value) =>
                                    Validators.validatePhoneNumber(value),
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
                              GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    authViewModel.signUp(SignUpEntity(
                                        username: usernameController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        rePassword:
                                            confirmPasswordController.text,
                                        phone: phoneNumberController.text));
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
                                        style: AppStyles.styleMedium16(context)
                                            .copyWith(
                                                color: AppColors.whiteColor),
                                      ),
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: AppStyles.styleRegular14(context)
                                        .copyWith(
                                            color: AppColors.blackBaseColor),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).pop();
                                      },
                                      child: Text("Login",
                                          style:
                                              AppStyles.styleMedium16(context)
                                                  .copyWith(
                                            color: AppColors.blueBaseColor,
                                            decoration:
                                                TextDecoration.underline,
                                          )))
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
