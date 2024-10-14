import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_in_model.dart';
class SignInEntity {
  final String? email;
  final String? password;


  SignInEntity({
    this.email,
    this.password,
  });


  SignInModel toModel() {
    return SignInModel(
      email: email,
      password: password,
    );
  }
}