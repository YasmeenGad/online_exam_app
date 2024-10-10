import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/signup/auth_states.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/signup/auth_view_model.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_signup_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_button.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_footer.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_form.dart';

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
                {
                  var exception = state.exception;
                  var message = "Something went wrong";

                  if (exception is NoInternetException) {
                    message = exception.message.toString();
                  } else if (exception is ServerError) {
                    message = exception.serverMessage.toString();
                  } else if (exception is UnknownErrorException) {
                    message = exception.unknownErrorMessage.toString();
                  }
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
                          child: SignUpForm(
                            formKey: formKey,
                            usernameController: usernameController,
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController:
                                confirmPasswordController,
                            phoneNumberController: phoneNumberController,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 32,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Container(
                          child: Column(
                            children: [
                              SignUpButton(
                                formKey: formKey,
                                authViewModel: authViewModel,
                                usernameController: usernameController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController,
                                emailController: emailController,
                                passwordController: passwordController,
                                confirmPasswordController:
                                    confirmPasswordController,
                                phoneNumberController: phoneNumberController,
                              ),
                              const SignUpFooter(),
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
