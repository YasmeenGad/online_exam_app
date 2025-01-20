import 'package:online_exam_app/src/features/questions/data/api/models/request/check_question_request_dto.dart';

class CheckQuestionRequestEntity {
  final List<AnswersEntity>? answers;

  CheckQuestionRequestEntity({this.answers});

  CheckQuestionRequestDto toDto() {
    return CheckQuestionRequestDto(
      answers: answers?.map((answer) => answer.toDto()).toList(),
    );
  }
}

class AnswersEntity {
  final String? questionId;
  final String? correct;

  AnswersEntity({this.questionId, this.correct});

  AnswersDto toDto() {
    return AnswersDto(
      correct: correct,
      questionId: questionId,
    );
  }
}
