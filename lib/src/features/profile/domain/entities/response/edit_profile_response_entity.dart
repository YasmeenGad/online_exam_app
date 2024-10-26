class EditProfileResponseEntity {
  final String? message;
  final UserEntity? user;

  EditProfileResponseEntity({
    this.message,
    this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
    };
  }

  factory EditProfileResponseEntity.fromJson(Map<String, dynamic> json) {
    return EditProfileResponseEntity(
      message: json['message'],
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'password': password,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'passwordChangedAt': passwordChangedAt,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      Id: json['Id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      password: json['password'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      passwordChangedAt: json['passwordChangedAt'],
    );
  }
}
