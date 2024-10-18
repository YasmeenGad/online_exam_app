import 'package:json_annotation/json_annotation.dart';

part 'error_profile_data_response.g.dart';

@JsonSerializable()
class ErrorProfileDataResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "stack")
  final String? stack;

  ErrorProfileDataResponse ({
    this.message,
    this.code,
    this.stack,
  });

  factory ErrorProfileDataResponse.fromJson(Map<String, dynamic> json) {
    return _$ErrorProfileDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ErrorProfileDataResponseToJson(this);
  }
}


