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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({super.key});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = getIt.get<AuthViewModel>();
  }
  Widget build(BuildContext context) {

    return BlocProvider<AuthViewModel>(
      create: (context) => authViewModel,
      child: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoading():
              {
                CustomToast.showLoadingToast(message: "${AppLocalizations.of(context)!.loading}");

                break;
              }
            case LoginError():
              {
                CustomToast.showErrorToast(message: state.exception.toString());
                break;
              }
            case LoginSuccess():
              {
                CustomToast.showSuccessToast(message: "${AppLocalizations.of(context)!.success}");
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
                  hintText: '${AppLocalizations.of(context)!.hintEmail}',
                  labelText: '${AppLocalizations.of(context)!.labelEmail}',
                  validator: (value) => Validators.validateEmail(value, context),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: '${AppLocalizations.of(context)!.hintPassword}',
                  labelText: '${AppLocalizations.of(context)!.labelPassword}',
                  validator: (value) => Validators.validatePassword(value, context),
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
                        ), context);
                      }
                    },
                    child: CustomButton(
                      txt: "${AppLocalizations.of(context)!.login}",
                    )),
                const SizedBox(height: 13),
                AuthFooter(question: "${AppLocalizations.of(context)!.dontHaveAnAccount}", txt: "${AppLocalizations.of(context)!.signUp}", route: RoutesName.signUpView,),
              ],
            ),
          );
        },
      ),
    );
  }
}
