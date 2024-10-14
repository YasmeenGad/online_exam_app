import 'package:online_exam_app/src/features/auth/data/api/models/request/forget_password_model.dart';

class ForgetPasswordEntity {
  String? email;

  ForgetPasswordEntity({
    this.email,
  });
  
  ForgetPasswordModel toModel() {
    return ForgetPasswordModel(
      email: email!,
    );
  }

  
}
