import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProfileDataResponseDto {
  final String? message;
  final User? user;

  ProfileDataResponseDto({
    this.message,
    this.user,
  });
}

@JsonSerializable()
class User {
  final String? Id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  User({
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
}
