import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/account_text.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/button_widget.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/text_field_widget.dart';
import '../cubit/login/login_cubit.dart';
import '../widgets/forget_password_text.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({super.key, required this.cubit, required this.state});

 final LoginCubit cubit;
 final LoginState state;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: cubit.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            TextFieldWidget(
              controller: cubit.emailController,
              validator: (value) => cubit.validEmail(value),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 30),
            TextFieldWidget(
              controller: cubit.passwordController,
              validator: (value) => cubit.validPassword(value),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              labelText: 'Password',
              hintText: 'Enter your password',
              obsecureText: true,
            ),
            const SizedBox(height: 5),
            forgetPasswordText(context),
            const SizedBox(height: 100),
            ButtonWidget(
              loading: state is LoginLoading,
              onPressed: () {
                cubit.doAction();
              },
              text: 'Login',
            ),
            const SizedBox(height: 20),
            AccountText(
              onPressed: () {},
              text: 'Don\'t have an account?',
              text2: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
