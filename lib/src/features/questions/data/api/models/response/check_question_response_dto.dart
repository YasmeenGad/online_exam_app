import 'package:json_annotation/json_annotation.dart';

part 'check_question_response_dto.g.dart';

@JsonSerializable()
class CheckQuestionResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "correct")
  final int? correct;
  @JsonKey(name: "wrong")
  final int? wrong;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "WrongQuestions")
  final List<WrongQuestion>? WrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CorrectQuestions>? correctQuestions;

  CheckQuestionResponseDto({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.WrongQuestions,
    this.correctQuestions,
  });

  factory CheckQuestionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionResponseDtoToJson(this);
  }
}

@JsonSerializable()
class WrongQuestion {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final AnswersResponse? answers;

  WrongQuestion({
    this.QID,
    this.Question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestion.fromJson(Map<String, dynamic> json) {
    return _$WrongQuestionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WrongQuestionToJson(this);
  }
}

@JsonSerializable()
class AnswersResponse {
  AnswersResponse();

  factory AnswersResponse.fromJson(Map<String, dynamic> json) {
    return _$AnswersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersResponseToJson(this);
  }
}

@JsonSerializable()
class CorrectQuestions {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final AnswersResponse? answers;

  CorrectQuestions({
    this.QID,
    this.Question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestions.fromJson(Map<String, dynamic> json) {
    return _$CorrectQuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CorrectQuestionsToJson(this);
  }
}
