class CheckQuestionResponseEntity {
  final String? message;
  final int? correct;
  final int? wrong;
  final String? total;
  final List<WrongQuestionEntity>? WrongQuestions;
  final List<CorrectQuestionsEntity>? correctQuestions;

  CheckQuestionResponseEntity({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.WrongQuestions,
    this.correctQuestions,
  });
}

class WrongQuestionEntity {
  final String? QID;
  final String? Question;
  final String? inCorrectAnswer;
  final String? correctAnswer;
  final AnswersResponseEntity? answers;

  WrongQuestionEntity({
    this.QID,
    this.Question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });
}

class AnswersResponseEntity {
  AnswersResponseEntity();
}

class CorrectQuestionsEntity {
  final String? QID;
  final String? Question;
  final String? correctAnswer;
  final AnswersResponseEntity? answers;

  CorrectQuestionsEntity({
    this.QID,
    this.Question,
    this.correctAnswer,
    this.answers,
  });
}
