import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  ChangePasswordRequestDto({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestDtoToJson(this);
  }
}
