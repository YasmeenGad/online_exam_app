import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel {

 String? email;

  ForgetPasswordModel({
    this.email,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
  };

  ForgetPasswordEntity toEntity() {
    return ForgetPasswordEntity(
      email: email,
    );
  }
}