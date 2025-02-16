import 'package:json_annotation/json_annotation.dart';

part 'check_question_request_dto.g.dart';

@JsonSerializable()
class CheckQuestionRequestDto {
  @JsonKey(name: "answers")
  final List<AnswersDto>? answers;

  CheckQuestionRequestDto({
    this.answers,
  });

  factory CheckQuestionRequestDto.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionRequestDtoToJson(this);
  }
}

@JsonSerializable()
class AnswersDto {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  AnswersDto({
    this.questionId,
    this.correct,
  });

  factory AnswersDto.fromJson(Map<String, dynamic> json) {
    return _$AnswersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersDtoToJson(this);
  }
}
