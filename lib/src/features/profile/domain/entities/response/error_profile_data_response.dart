import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ErrorProfileDataResponseDto {
  final String? message;
  final int? code;
  final String? stack;

  ErrorProfileDataResponseDto({
    this.message,
    this.code,
    this.stack,
  });
}
