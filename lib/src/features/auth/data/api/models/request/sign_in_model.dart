import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
class SignInModel {
  final String? email;
  final String? password;

  SignInModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };


  SignInEntity toEntity() {
    return SignInEntity(
      email: email,
      password: password,
    );
  }
}

  
  