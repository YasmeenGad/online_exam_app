import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

part 'subjects_response_dto.g.dart';

@JsonSerializable()
class SubjectsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectsDto>? subjects;

  SubjectsResponseDto({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsResponseDtoToJson(this);
  }

  List<Subject> toDomain() {
    return subjects?.map((subjectDto) => subjectDto.toDomain()).toList() ?? [];
  }
}

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  MetadataDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }
}

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }

  Subject toDomain() {
    return Subject(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}
