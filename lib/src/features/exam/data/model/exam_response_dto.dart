import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/exam_entity.dart';
import 'exam_dto.dart';
import 'meta_data_dto.dart';

part 'exam_response_dto.g.dart';

@JsonSerializable()
class ExamResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "exams")
  final List<ExamDto>? exams;

  ExamResponseDto({
    this.message,
    this.exams,
    this.metadata,
  });

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseDtoToJson(this);


  List<Exam> toDomain() {
    return exams?.map((examDto) => examDto.toDomain()).toList() ?? [];
  }
}


