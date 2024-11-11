class CheckQuestionResponseEntity {
  final String? message;
  final int? correct;
  final int? wrong;
  final String? total;
  final List<WrongQuestionEntity>? wrongQuestions;
  final List<CorrectQuestionsEntity>? correctQuestions;

  CheckQuestionResponseEntity({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  String toString() {
    return 'CheckQuestionResponseEntity(message: $message, correct: $correct, wrong: $wrong, total: $total, wrongQuestions: $wrongQuestions, correctQuestions: $correctQuestions)';
  }
  // factory CheckQuestionResponseEntity.fromJson(Map<String, dynamic> json) {
  //   print("Parsing CheckQuestionResponseEntity: $json");
  //   return CheckQuestionResponseEntity(
  //     message: json['message'] as String?,
  //     correct: json['correct'] as int?,
  //     wrong: json['wrong'] as int?,
  //     total: json['total'] as String?,
  //     wrongQuestions: (json['wrongQuestions'] as List<dynamic>?)
  //         ?.map((e) => WrongQuestionEntity.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //     correctQuestions: (json['correctQuestions'] as List<dynamic>?)
  //         ?.map((e) => CorrectQuestionsEntity.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }
  factory CheckQuestionResponseEntity.fromJson(Map<String, dynamic> json) {
    print("Parsing CheckQuestionResponseEntity: $json");
    return CheckQuestionResponseEntity(
      message: json['message'] as String?,
      correct: json['correct'] as int?,
      wrong: json['wrong'] as int?,
      total: json['total'] as String?,
      wrongQuestions: (json['wrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestionEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestionsEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'correct': correct,
      'wrong': wrong,
      'total': total,
      'wrongQuestions': wrongQuestions?.map((e) => e.toJson()).toList(),
      'correctQuestions': correctQuestions?.map((e) => e.toJson()).toList(),
    };
  }
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

  factory WrongQuestionEntity.fromJson(Map<String, dynamic> json) {
    return WrongQuestionEntity(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] != null
          //? AnswersResponseEntity.fromJson(json['answers'] as Map<String, dynamic>)
          ? AnswersResponseEntity.fromJson(Map<String, dynamic>.from(json['answers'] as Map))

          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'QID': QID,
      'Question': Question,
      'inCorrectAnswer': inCorrectAnswer,
      'correctAnswer': correctAnswer,
      'answers': answers?.toJson(),
    };
  }
}

class AnswersResponseEntity {

  AnswersResponseEntity();

  factory AnswersResponseEntity.fromJson(Map<String, dynamic> json) {
    return AnswersResponseEntity();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
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

  factory CorrectQuestionsEntity.fromJson(Map<String, dynamic> json) {
    return CorrectQuestionsEntity(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] != null
       //   ? AnswersResponseEntity.fromJson(json['answers'] as Map<String, dynamic>)
          ? AnswersResponseEntity.fromJson(Map<String, dynamic>.from(json['answers'] as Map))

          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'QID': QID,
      'Question': Question,
      'correctAnswer': correctAnswer,
      'answers': answers?.toJson(),
    };
  }
}

// import 'package:hive/hive.dart';
//
// part 'check_question_response_entity.g.dart';
//
// @HiveType(typeId: 0)
// class CheckQuestionResponseEntity {
//   @HiveField(0)
//   final String? message;
//   @HiveField(1)
//   final int? correct;
//   @HiveField(2)
//   final int? wrong;
//   @HiveField(3)
//   final String? total;
//   @HiveField(4)
//   final List<WrongQuestionEntity>? wrongQuestions;
//   @HiveField(5)
//   final List<CorrectQuestionsEntity>? correctQuestions;
//
//   CheckQuestionResponseEntity({
//     this.message,
//     this.correct,
//     this.wrong,
//     this.total,
//     this.wrongQuestions,
//     this.correctQuestions,
//   });
//
//   factory CheckQuestionResponseEntity.fromJson(Map<String, dynamic> json) {
//     return CheckQuestionResponseEntity(
//       message: json['message'] as String?,
//       correct: json['correct'] as int?,
//       wrong: json['wrong'] as int?,
//       total: json['total'] as String?,
//       wrongQuestions: (json['wrongQuestions'] as List<dynamic>?)
//           ?.map((e) => WrongQuestionEntity.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       correctQuestions: (json['correctQuestions'] as List<dynamic>?)
//           ?.map((e) => CorrectQuestionsEntity.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'correct': correct,
//       'wrong': wrong,
//       'total': total,
//       'wrongQuestions': wrongQuestions?.map((e) => e.toJson()).toList(),
//       'correctQuestions': correctQuestions?.map((e) => e.toJson()).toList(),
//     };
//   }
// }
//
// @HiveType(typeId: 1)
// class WrongQuestionEntity {
//   @HiveField(0)
//   final String? QID;
//   @HiveField(1)
//   final String? Question;
//   @HiveField(2)
//   final String? inCorrectAnswer;
//   @HiveField(3)
//   final String? correctAnswer;
//   @HiveField(4)
//   final AnswersResponseEntity? answers;
//
//   WrongQuestionEntity({
//     this.QID,
//     this.Question,
//     this.inCorrectAnswer,
//     this.correctAnswer,
//     this.answers,
//   });
//
//   factory WrongQuestionEntity.fromJson(Map<String, dynamic> json) {
//     return WrongQuestionEntity(
//       QID: json['QID'] as String?,
//       Question: json['Question'] as String?,
//       inCorrectAnswer: json['inCorrectAnswer'] as String?,
//       correctAnswer: json['correctAnswer'] as String?,
//       answers: json['answers'] as AnswersResponseEntity?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'QID': QID,
//       'Question': Question,
//       'inCorrectAnswer': inCorrectAnswer,
//       'correctAnswer': correctAnswer,
//       'answers': answers
//     };
//   }
// }
//
// @HiveType(typeId: 2)
// class AnswersResponseEntity {
//   AnswersResponseEntity();
// }
//
// @HiveType(typeId: 3)
// class CorrectQuestionsEntity {
//   @HiveField(0)
//   final String? QID;
//   @HiveField(1)
//   final String? Question;
//   @HiveField(2)
//   final String? correctAnswer;
//   @HiveField(3)
//   final AnswersResponseEntity? answers;
//
//   CorrectQuestionsEntity({
//     this.QID,
//     this.Question,
//     this.correctAnswer,
//     this.answers,
//   });
//
//   factory CorrectQuestionsEntity.fromJson(Map<String, dynamic> json) {
//     return CorrectQuestionsEntity(
//       QID: json['QID'] as String?,
//       Question: json['Question'] as String?,
//       correctAnswer: json['correctAnswer'] as String?,
//       answers: json['answers'] as AnswersResponseEntity?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'QID': QID,
//       'Question': Question,
//       'correctAnswer': correctAnswer,
//       'answers': answers
//     };
//   }
// }
