import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/exam_entity.dart';
import 'exam_dto.dart';

part 'exam_details_response_dto.g.dart';

@JsonSerializable()
class ExamDetailsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "exam")
  final ExamDto? exam;

  ExamDetailsResponseDto({
    this.message,
    this.exam,
  });

  factory ExamDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailsResponseDtoToJson(this);


  Exam? toDomain() {
    return exam?.toDomain() ;
  }
}

