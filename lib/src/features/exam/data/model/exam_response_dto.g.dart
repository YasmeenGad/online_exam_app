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
    );

Map<String, dynamic> _$ExamResponseDtoToJson(ExamResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exams': instance.exams,
    };

ExamDto _$ExamDtoFromJson(Map<String, dynamic> json) => ExamDto(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamDtoToJson(ExamDto instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
