class ProfileDataResponse {
  final String? message;
  final UserEntity? user;

  ProfileDataResponse({
    this.message,
    this.user,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
    };
  }

  factory ProfileDataResponse.fromJson(Map<dynamic, dynamic> json) {
    return ProfileDataResponse(
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
  final bool? isVerified;
  final String? createdAt;

  UserEntity({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'Id': Id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'isVerified': isVerified,
      'createdAt': createdAt,
    };
  }

  factory UserEntity.fromJson(Map<dynamic, dynamic> json) {
    return UserEntity(
      Id: json['Id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
    );
  }
}
