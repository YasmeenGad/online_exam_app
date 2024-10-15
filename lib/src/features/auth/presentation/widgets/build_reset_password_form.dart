import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependency injection/di.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_toast.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/validators/validators.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../cubit/auth/auth_states.dart';
import '../cubit/auth/auth_view_model.dart';
import 'custom_text_form_field.dart';
import 'forget_password_description.dart';

class BuildResetPasswordForm extends StatefulWidget {
  const BuildResetPasswordForm({super.key});

  @override
  State<BuildResetPasswordForm> createState() => _BuildResetPasswordFormState();
}

class _BuildResetPasswordFormState extends State<BuildResetPasswordForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final AuthViewModel authViewModel;
  @override
  void initState() {
    super.initState();
    authViewModel = getIt.get<AuthViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authViewModel,
      child: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordError) {
            CustomToast.showErrorToast(message: state.exception.toString());
          } else if (state is ResetPasswordSuccess) {
            CustomToast.showSuccessToast(message: "Success");
            Navigator.pushNamed(context, RoutesName.loginView);
          } else if (state is ResetPasswordLoading) {
            CustomToast.showLoadingToast(message: "Loading...");
          }
        },
        buildWhen: (previous, current) {
          return current is AuthInitialState;
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                forgetPasswordDescription(
                  context,
                  'Reset password',
                  'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
                ),
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
                  hintText: 'Enter New Password',
                  labelText: 'New Password',
                  validator: (value) => Validators.validatePassword(value),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authViewModel.resetPassword(
                      ResetPasswordEntity(
                        email: emailController.text,
                        newPassword: passwordController.text,
                      )
                        );
                      }
                    },
                    child: CustomButton(
                      txt: "Continue",
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
