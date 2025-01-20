class QuestionResponseEntity {
  String? message;

  List<QuestionsEntity>? questions;

  QuestionResponseEntity({
    this.message,
    this.questions,
  });

  String toString() {
    return 'QuestionResponseEntity(message: $message, questions: $questions)';
  }
  // factory QuestionResponseEntity.fromJson(Map<String, dynamic> json) {
  //   return QuestionResponseEntity(
  //     message: json['message'] as String?,
  //     questions: (json['questions'] as List<dynamic>?)
  //         ?.map((e) => QuestionsEntity.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }
  factory QuestionResponseEntity.fromJson(Map<String, dynamic> json) {
    return QuestionResponseEntity(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionsEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'questions': questions?.map((e) => e.toJson()).toList(),
    };
  }
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

  String toString() {
    return 'QuestionsEntity(answers: $answers, type: $type, Id: $Id, question: $question, correct: $correct, subject: $subject, exam: $exam, createdAt: $createdAt)';
  }
  // factory QuestionsEntity.fromJson(Map<String, dynamic> json) {
  //   return QuestionsEntity(
  //     answers: (json['answers'] as List<dynamic>?)
  //         ?.map((e) => QuestionsAnswersEntity.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //     type: json['type'] as String?,
  //     Id: json['_id'] as String?,
  //     question: json['question'] as String?,
  //     correct: json['correct'] as String?,
  //     subject: json['subject'] == null
  //         ? null
  //         : QuestionsSubjectEntity.fromJson(json['subject'] as Map<String, dynamic>),
  //     exam: json['exam'] == null
  //         ? null
  //         : QuestionsExamEntity.fromJson(json['exam'] as Map<String, dynamic>),
  //     createdAt: json['createdAt'] as String?,
  //   );
  // }
  factory QuestionsEntity.fromJson(Map<String, dynamic> json) {
    return QuestionsEntity(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuestionsAnswersEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      type: json['type'] as String?,
      Id: json['_id'] as String?,
      question: json['question'] as String?,
      correct: json['correct'] as String?,
      subject: json['subject'] == null
          ? null
          : QuestionsSubjectEntity.fromJson(Map<String, dynamic>.from(json['subject'] as Map)),
      exam: json['exam'] == null
          ? null
          : QuestionsExamEntity.fromJson(Map<String, dynamic>.from(json['exam'] as Map)),
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers?.map((e) => e.toJson()).toList(),
      'type': type,
      '_id': Id,
      'question': question,
      'correct': correct,
      'subject': subject?.toJson(),
      'exam': exam?.toJson(),
      'createdAt': createdAt,
    };
  }
}

class QuestionsAnswersEntity {
  String? answer;

  String? key;

  QuestionsAnswersEntity({
    this.answer,
    this.key,
  });

  String toString() {
    return 'QuestionsAnswersEntity(answer: $answer, key: $key)';
  }
  factory QuestionsAnswersEntity.fromJson(Map<String, dynamic> json) {
    return QuestionsAnswersEntity(
      answer: json['answer'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'key': key,
    };
  }

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

  factory QuestionsSubjectEntity.fromJson(Map<String, dynamic> json) {
    return QuestionsSubjectEntity(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': Id,
      'name': name,
      'icon': icon,
      'createdAt': createdAt,
    };
  }
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

  factory QuestionsExamEntity.fromJson(Map<String, dynamic> json) {
    return QuestionsExamEntity(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: json['duration'] as int?,
      subject: json['subject'] as String?,
      numberOfQuestions: json['numberOfQuestions'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': Id,
      'title': title,
      'duration': duration,
      'subject': subject,
      'numberOfQuestions': numberOfQuestions,
      'active': active,
      'createdAt': createdAt,
    };
  }
}
