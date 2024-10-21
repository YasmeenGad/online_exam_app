import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/response/edit_profile_response_entity.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  EditProfileResponseDto({
    this.message,
    this.user,
  });

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileResponseDtoToJson(this);
  }

  EditProfileResponseEntity toEntity() {
    return EditProfileResponseEntity(
      message: message,
      user: user?.toEntity(),
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  UserEntity toEntity() {
    return UserEntity(
      Id: Id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
    );
  }
}
