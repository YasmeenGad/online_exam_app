// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_question_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionResponseDto _$CheckQuestionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckQuestionResponseDto(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
      WrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckQuestionResponseDtoToJson(
        CheckQuestionResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'WrongQuestions': instance.WrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };

WrongQuestion _$WrongQuestionFromJson(Map<String, dynamic> json) =>
    WrongQuestion(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : AnswersResponse.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WrongQuestionToJson(WrongQuestion instance) =>
    <String, dynamic>{
      'QID': instance.QID,
      'Question': instance.Question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };

AnswersResponse _$AnswersResponseFromJson(Map<String, dynamic> json) =>
    AnswersResponse();

Map<String, dynamic> _$AnswersResponseToJson(AnswersResponse instance) =>
    <String, dynamic>{};

CorrectQuestions _$CorrectQuestionsFromJson(Map<String, dynamic> json) =>
    CorrectQuestions(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : AnswersResponse.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CorrectQuestionsToJson(CorrectQuestions instance) =>
    <String, dynamic>{
      'QID': instance.QID,
      'Question': instance.Question,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
