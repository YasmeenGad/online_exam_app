// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponseDto _$ExamResponseDtoFromJson(Map<String, dynamic> json) =>
    ExamResponseDto(
      message: json['message'] as String?,
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamResponseDtoToJson(ExamResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
