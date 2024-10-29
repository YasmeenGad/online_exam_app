class QuestionResponseEntity {
  String? message;

  List<QuestionsEntity>? questions;

  QuestionResponseEntity({
    this.message,
    this.questions,
  });
}

class QuestionsEntity {
  List<QuestionsAnswersEntity>? answers;

  String? type;

  String? Id;

  String? question;

  String? correct;

  QuestionsSubjectEntity? subject;

  QuestionsExamEntity? exam;

  String? createdAt;

  QuestionsEntity({
    this.answers,
    this.type,
    this.Id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });
}

class QuestionsAnswersEntity {
  String? answer;

  String? key;

  QuestionsAnswersEntity({
    this.answer,
    this.key,
  });
}

class QuestionsSubjectEntity {
  String? Id;

  String? name;

  String? icon;

  String? createdAt;

  QuestionsSubjectEntity({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });
}

class QuestionsExamEntity {
  String? Id;

  String? title;

  int? duration;

  String? subject;

  int? numberOfQuestions;

  bool? active;

  String? createdAt;

  QuestionsExamEntity({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
}
