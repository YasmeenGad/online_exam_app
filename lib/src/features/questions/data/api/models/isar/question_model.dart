import 'package:isar/isar.dart';

import '../../../../domain/entities/response/check_question_response_entity.dart';

part 'question_model.g.dart';

@Collection()
class QuestionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String questionId;
  late String? attemptId;
  late String questionText;
  late String questionType;

  late String correctAnswer;
  late String? userAnswer;

  late List<AnswerModel> suggestedAnswers;

  @Index()
  late String examId;

  bool get isCorrect => userAnswer == correctAnswer;

  QuestionModel({
    required this.questionId,
    required this.questionText,
    required this.questionType,
    required this.correctAnswer,
    required this.userAnswer,
    required this.suggestedAnswers,
    required this.examId,
    this.attemptId,
  });
}

@Embedded()
class AnswerModel {
  late String? answerText;

  AnswerModel({
    this.answerText,
  });
}

@Embedded()
class CheckResultModel {
  late String? message;
  late int? correct;
  late int? wrong;
  late String? total;

  late List<WrongQuestionModel>? wrongQuestions;

  late List<CorrectQuestionModel>? correctQuestions;

  CheckResultModel({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });
}

@Embedded()
class WrongQuestionModel {
  late String? questionId;
  late String? questionText;
  late String? incorrectAnswer;
  late String? correctAnswer;

  WrongQuestionModel({
    this.questionId,
    this.questionText,
    this.incorrectAnswer,
    this.correctAnswer,
  });
}

@Embedded()
class CorrectQuestionModel {
  late String? questionId;
  late String? questionText;
  late String? correctAnswer;

  CorrectQuestionModel({
    this.questionId,
    this.questionText,
    this.correctAnswer,
  });
}

List<CorrectQuestionModel> convertToCorrectQuestionModel(
    List<CorrectQuestionsEntity> entities) {
  return entities.map((e) {
    return CorrectQuestionModel(
      questionId: e.QID,
      questionText: e.Question,
      correctAnswer: e.correctAnswer,
    );
  }).toList();
}

List<WrongQuestionModel> convertToWrongQuestionModel(
    List<WrongQuestionEntity> entities) {
  return entities.map((e) {
    return WrongQuestionModel(
      questionId: e.QID,
      questionText: e.Question,
      incorrectAnswer: e.inCorrectAnswer,
      correctAnswer: e.correctAnswer,
    );
  }).toList();
}
