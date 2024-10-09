import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/build_login_form.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/dialog.dart';
import '../../../../core/dependency injection/di.dart';
import '../cubit/login/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/loginView';

  @override
  Widget build(BuildContext context) {
    LoginCubit viewModel = getIt.get<LoginCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state)  {
            if (state is LoginError) {
              showToast(state.exception.toString());
            //  showToast('incorrect email or password');
              print(state.exception);
            } else if (state is LoginSuccess) {
             showToast('Login Success');

            }
          },
          builder: (context, state) {
           final cubit = context.read<LoginCubit>();
            return BuildLoginForm(cubit: cubit, state: state);
          },
        ),
      ),
    );
  }
}
