import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  SignInResponse({
    this.message,
    this.token,
    this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInResponseToJson(this);
  }
}

@JsonSerializable()
class User {
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
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.Id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
