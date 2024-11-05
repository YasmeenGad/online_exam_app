// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_question_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionRequestDto _$CheckQuestionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CheckQuestionRequestDto(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckQuestionRequestDtoToJson(
        CheckQuestionRequestDto instance) =>
    <String, dynamic>{
      'answers': instance.answers,
    };

AnswersDto _$AnswersDtoFromJson(Map<String, dynamic> json) => AnswersDto(
      questionId: json['questionId'] as String?,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersDtoToJson(AnswersDto instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
