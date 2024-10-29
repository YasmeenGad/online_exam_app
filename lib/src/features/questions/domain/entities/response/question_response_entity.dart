class QuestionResponseEntity {
  final String? message;

  final List<QuestionsEntity>? questions;

  QuestionResponseEntity({
    this.message,
    this.questions,
  });
}

class QuestionsEntity {
  final List<AnswersEntity>? answers;

  final String? type;

  final String? Id;

  final String? question;

  final String? correct;

  final SubjectEntity? subject;

  final ExamEntity? exam;

  final String? createdAt;

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

class AnswersEntity {
  final String? answer;

  final String? key;

  AnswersEntity({
    this.answer,
    this.key,
  });
}

class SubjectEntity {
  final String? Id;

  final String? name;

  final String? icon;

  final String? createdAt;

  SubjectEntity({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });
}

class ExamEntity {
  final String? Id;

  final String? title;

  final int? duration;

  final String? subject;

  final int? numberOfQuestions;

  final bool? active;

  final String? createdAt;

  ExamEntity({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
}
