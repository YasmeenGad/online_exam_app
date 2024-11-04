import 'package:json_annotation/json_annotation.dart';

part 'check_question_request_dto.g.dart';

@JsonSerializable()
class CheckQuestionRequestDto {
  @JsonKey(name: "answers")
  final List<Answers>? answers;

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
class Answers {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  Answers({
    this.questionId,
    this.correct,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}
