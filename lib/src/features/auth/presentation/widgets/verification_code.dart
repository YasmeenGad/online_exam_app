import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/verification_code_input.dart';

import '../../domain/entities/email_verification_entity.dart';
import '../cubit/auth/auth_view_model.dart';

class VerificationCode extends StatelessWidget {
  final bool hasError;
  final AuthViewModel authViewModel ;


  const VerificationCode({
    Key? key,
    required this.hasError, required this.authViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return Row(
            children: [
              VerificationCodeInput(
                controller: _controllers[index],
                hasError: hasError,
                onChanged: (value) {
                  if (value.length == 1) {
                    if (index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else {
                      String code = _controllers
                          .map((controller) => controller.text)
                          .join();
                      authViewModel.verifyEmail(
                        EmailVerificationEntity(resetCode: code),
                        context
                      );
                    }
                  }
                },
              ),
              if (index != 5) const SizedBox(width: 5),
            ],
          );
        }),
      ),
    );
  }
}
