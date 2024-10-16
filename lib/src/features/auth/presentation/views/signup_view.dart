import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_view_model.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_button.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/auth_footer.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              case SignUpLoadingState():
                {
                  CustomToast.showLoadingToast(message: "${AppLocalizations.of(context)!.loading}");

                  break;
                }
              case SignUpErrorState():
                {
                  CustomToast.showErrorToast(
                      message: state.exception.toString());
                  break;
                }
              case SignUpSuccessState():
                {
                  CustomToast.showSuccessToast(message: "${AppLocalizations.of(context)!.success}");
                  Navigator.pushReplacementNamed(context, RoutesName.loginView);
                  // Navigator.pushNamed(context, RoutesName.homeView);
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
                          child: CustomAppBar(
                            appBarTxt: '${AppLocalizations.of(context)!.signUp}',
                          ),
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
                               AuthFooter(
                                question: "${AppLocalizations.of(context)!.alreadyHaveAnAccount}?",
                                txt: "${AppLocalizations.of(context)!.login}",
                                route: RoutesName.loginView,
                              ),
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
