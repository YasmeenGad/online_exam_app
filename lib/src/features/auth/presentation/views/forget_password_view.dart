import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/global/custom_toast.dart';
import 'package:online_exam_app/src/core/utils/validators/validators.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/auth/auth_view_model.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/di/di.dart';
import '../../../../core/routes/routes_name.dart';
import '../widgets/forget_password_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
            if (state is ForgetPasswordLoading) {
              CustomToast.showLoadingToast(message: "${AppLocalizations.of(context)!.loading}");
            } else if (state is ForgetPasswordError) {
              CustomToast.showErrorToast(message: state.exception.toString());
            } else if (state is ForgetPasswordSuccess) {
              CustomToast.showSuccessToast(message: "${AppLocalizations.of(context)!.success}");
              Navigator.pushReplacementNamed(context, RoutesName.emailVerificationView, arguments: emailController.text.trim());
            }
          },
          buildWhen: (previous, current) => current is AuthInitialState,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
              child: Column(
                children: [
                  CustomAppBar(
                    appBarTxt: '${AppLocalizations.of(context)!.labelPassword}',
                    showArrow: true,
                  ),
                  Form(
                    key: forgetFormKey,
                    child: Column(
                      children: [
                        forgetPasswordDescription(
                          context,
                          '${AppLocalizations.of(context)!.forgetPassword}',
                          '${AppLocalizations.of(context)!.pleaseEnterYourEmailAssociatedToYourAccount}',
                        ),
                        SizedBox(height: 30),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: '${AppLocalizations.of(context)!.hintEmail}',
                          labelText: '${AppLocalizations.of(context)!.labelEmail}',
                          validator: (value) => Validators.validateEmail(value, context),
                        ),
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {
                            if (forgetFormKey.currentState!.validate()) {
                              authViewModel.forgetPassword(
                                ForgetPasswordEntity(email: emailController.text.trim()),
                                context
                              );
                            }
                          },
                          child: CustomButton(txt: '${AppLocalizations.of(context)!.labelContinue}'),
                        ),
                      ],
                    ),
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
