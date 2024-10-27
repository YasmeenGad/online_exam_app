// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailsResponseDto _$ExamDetailsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ExamDetailsResponseDto(
      message: json['message'] as String?,
      exam: json['exam'] == null
          ? null
          : ExamDto.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamDetailsResponseDtoToJson(
        ExamDetailsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exam': instance.exam,
    };
