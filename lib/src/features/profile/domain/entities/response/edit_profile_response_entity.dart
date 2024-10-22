class EditProfileResponseEntity {
  final String? message;
  final UserEntity? user;

  EditProfileResponseEntity({
    this.message,
    this.user,
  });
}

class UserEntity {
  final String? Id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? password;
  final bool? isVerified;
  final String? createdAt;
  final String? passwordChangedAt;

  UserEntity({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });
}
