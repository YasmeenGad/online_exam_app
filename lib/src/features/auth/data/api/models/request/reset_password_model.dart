import '../../../../domain/entities/reset_password_entity.dart';

class ResetPasswordModel {
  final String? email;
  final String? newPassword;

  ResetPasswordModel({
    required this.email,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'newPassword': newPassword,
    };
  }

  ResetPasswordEntity toEntity() {
    return ResetPasswordEntity(
      email: email,
      newPassword: newPassword,
    );
  }

}