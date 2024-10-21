import 'package:online_exam_app/src/features/profile/data/api/models/request/change_password_request_dto.dart';

class ChangePasswordRequestEntity {
  final String? oldPassword;
  final String? password;
  final String? rePassword;

  ChangePasswordRequestEntity({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  ChangePasswordRequestDto toDto() {
    return ChangePasswordRequestDto(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
