import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/auth_footer.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/verification_code.dart';
import '../../../../core/di/di.dart';
import '../../../../core/global/custom_toast.dart';
import '../../../../core/routes/routes_name.dart';
import '../cubit/auth/auth_states.dart';
import '../cubit/auth/auth_view_model.dart';
import 'forget_password_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BuildEmailVerificationForm extends StatefulWidget {
  BuildEmailVerificationForm({super.key});

  @override
  State<BuildEmailVerificationForm> createState() =>
      _BuildEmailVerificationFormState();
}

class _BuildEmailVerificationFormState
    extends State<BuildEmailVerificationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AuthViewModel authViewModel;
  bool hasError = false;

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
          if (state is VerifyEmailError) {
            setState(() {
              hasError = true;
            });
            CustomToast.showErrorToast(message: state.exception.toString());
          } else if (state is VerifyEmailSuccess) {
            setState(() {
              hasError = false;
            });
            CustomToast.showSuccessToast(message: "${AppLocalizations.of(context)!.success}");
            Navigator.pushNamed(context, RoutesName.resetPasswordView);
          } else if (state is VerifyEmailLoading) {
            CustomToast.showLoadingToast(message: "${AppLocalizations.of(context)!.loading}");
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
                  '${AppLocalizations.of(context)!.emailVerificationTitle}',
                  '${AppLocalizations.of(context)!.emailVerificationDescription}',
                ),
                const SizedBox(height: 30),
                VerificationCode(
                    hasError: hasError, authViewModel: authViewModel),
                const SizedBox(height: 50),
                AuthFooter(
                  question: "${AppLocalizations.of(context)!.dontReceiveCode}?",
                  txt: '${AppLocalizations.of(context)!.resend}',
                  route: RoutesName.forgetPasswordView,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
