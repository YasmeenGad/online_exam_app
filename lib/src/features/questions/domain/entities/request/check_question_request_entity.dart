class CheckQuestionRequestEntity {
  final List<AnswersEntity>? answers;

  CheckQuestionRequestEntity({
    this.answers,
  });
}

class AnswersEntity {
  final String? questionId;
  final String? correct;

  AnswersEntity({
    this.questionId,
    this.correct,
  });
}
