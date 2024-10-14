import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/auth_footer.dart';
import '../cubit/auth/auth_view_model.dart';
import '../widgets/forget_password_text.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AuthViewModel authViewModel = getIt.get<AuthViewModel>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider<AuthViewModel>(
      create: (context) => authViewModel,
      child: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoading():
              {
                CustomToast.showLoadingToast(message: "Loading...");

                break;
              }
            case LoginError():
              {
                CustomToast.showErrorToast(message: state.exception.toString());
                break;
              }
            case LoginSuccess():
              {
                CustomToast.showSuccessToast(message: "Success");
                // Navigator.pushReplacementNamed(context, RoutesName.loginView);
                break;
              }
            default:
          }
        },
        buildWhen: (previous, current) => current is AuthInitialState,
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  validator: (value) => Validators.validateEmail(value),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  validator: (value) => Validators.validatePassword(value),
                ),
                const SizedBox(height: 16),
                forgetPasswordText(context),
                const SizedBox(height: 100),
                GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authViewModel.login(SignInEntity(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ));
                      }
                    },
                    child: CustomButton(
                      txt: "Sign In",
                    )),
                const SizedBox(height: 13),
                AuthFooter(question: "Don't have an account?", txt: "Sign Up", route: RoutesName.signUpView,),
              ],
            ),
          );
        },
      ),
    );
  }
}