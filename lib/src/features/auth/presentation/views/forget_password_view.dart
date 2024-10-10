import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/text_field_widget.dart';
import '../../../../core/dependency injection/di.dart';
import '../cubit/forget_password/password_cubit.dart';
import '../widgets/button_widget.dart';
import '../widgets/dialog.dart';
import '../widgets/forget_password_description.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = '/forgetPassword';



  @override
  Widget build(BuildContext context) {
    PasswordCubit viewModel = getIt.get<PasswordCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Password'),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocConsumer <PasswordCubit, PasswordState>(
          listener: (context, state) {
            if (state is PasswordError) {
              // Show the extracted error message
              showToast(state.exception.toString());
              print('error: ${state.exception}');
            } else if (state is PasswordSuccess) {
              showToast(state.password!.message!);
            }
          },

            builder: (context, state) {
            final cubit = context.read<PasswordCubit>();
            return  Form(
            key: cubit.forgetFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  children: [
                forgetPasswordDescription(context),
                SizedBox(height: 30),
                TextFieldWidget(
                  controller: cubit.emailController ,
                  validator: (value) => cubit.validEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                const SizedBox(height: 50),

                ButtonWidget(
                  loading: state is PasswordLoading,
                  onPressed: () {
                    cubit.doAction();
                  },
                  text: 'Continue',
                ),
              ]),
            ),
          );
          },
          ),
        ),

    );
  }
}
