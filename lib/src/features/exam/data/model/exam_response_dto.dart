import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/exam_entity.dart';

part 'exam_response_dto.g.dart';

@JsonSerializable()
class ExamResponseDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "exams")
  final List<ExamDto>? exams;

  ExamResponseDto({
    this.message,
    this.exams,
  });

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseDtoToJson(this);


  List<Exam> toDomain() {
    return exams?.map((examDto) => examDto.toDomain()).toList() ?? [];
  }
}

@JsonSerializable()
class ExamDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "duration")
  final int? duration;

  @JsonKey(name: "subject")
  final String? subject;

  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;

  @JsonKey(name: "active")
  final bool? active;

  @JsonKey(name: "createdAt")
  final String? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  Exam toDomain() {
    return Exam(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}
