import '../../data/api/models/request/reset_password_model.dart';

class ResetPasswordEntity {
  final String? email;
  final String? newPassword;

  ResetPasswordEntity({
    required this.email,
    required this.newPassword,
  });

  ResetPasswordModel toModel() {
    return ResetPasswordModel(
      email: email,
      newPassword: newPassword,
    );
  }
}