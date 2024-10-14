import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/core/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_view_model.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/dependency injection/di.dart';
import '../../../../core/routes/routes_name.dart';
import '../widgets/forget_password_description.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  late final AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = getIt.get<AuthViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<AuthViewModel>(
        create: (context) => authViewModel,
        child: BlocConsumer<AuthViewModel, AuthState>(
          listener: (context, state) {
            switch (state) {
              case ForgetPasswordLoading():
                {
                  CustomToast.showLoadingToast(message: "Loading...");

                  break;
                }
              case ForgetPasswordError():
                {
                  CustomToast.showErrorToast(
                      message: state.exception.toString());
                  break;
                }
              case ForgetPasswordSuccess():
                {
                  CustomToast.showSuccessToast(message: "Success");
                   Navigator.pushReplacementNamed(context, RoutesName.emailVerificationView);
                  break;
                }
              default:
            }
          },
          buildWhen: (previous, current) => current is AuthInitialState,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
              child: Column(
                children: [
                  CustomAppBar(
                    appBarTxt: 'Password',
                  ),
                  Form(
                    key: forgetFormKey,
                    child: Column(
                        children: [
                      forgetPasswordDescription(
                        context,
                        'Forget password?',
                        'Please enter your email associated to your account',
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        validator: (value) => Validators.validateEmail(value),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                          onTap: () {
                            if (forgetFormKey.currentState!.validate()) {
                              authViewModel.forgetPassword(ForgetPasswordEntity(
                                  email: emailController.text.trim()));
                            }
                          },
                          child: CustomButton(txt: 'Continue')),
                    ]),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
