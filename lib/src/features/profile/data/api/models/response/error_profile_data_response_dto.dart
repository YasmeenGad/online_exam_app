import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/error_profile_data_response.dart';

part 'error_profile_data_response_dto.g.dart';

@JsonSerializable()
class ErrorProfileDataResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "stack")
  final String? stack;

  ErrorProfileDataResponseDto({
    this.message,
    this.code,
    this.stack,
  });

  factory ErrorProfileDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ErrorProfileDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ErrorProfileDataResponseDtoToJson(this);
  }

  ErrorProfileDataResponse toDomain() {
    return ErrorProfileDataResponse(
      message: message,
      code: code,
      stack: stack,
    );
  }
}


