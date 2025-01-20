import 'package:isar/isar.dart';

import '../../../../domain/entities/response/check_question_response_entity.dart';

part 'question_model.g.dart';

@Collection()
class QuestionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String questionId;

  late String questionText; // نص السؤال
  late String questionType; // نوع السؤال

  late String correctAnswer; // الإجابة الصحيحة
  late String? userAnswer; // إجابة المستخدم

  late List<AnswerModel> suggestedAnswers; // الإجابات المقترحة

  @Index()
  late String examId;

  // التحقق من صحة الإجابة
  bool get isCorrect => userAnswer == correctAnswer;

  QuestionModel({
    required this.questionId,
    required this.questionText,
    required this.questionType,
    required this.correctAnswer,
    required this.userAnswer,
    required this.suggestedAnswers,
    required this.examId,
  });
}

@Embedded()
class AnswerModel {
  late String? answerText; // نص الإجابة

  AnswerModel({
    this.answerText,
  });
}

@Embedded()
class CheckResultModel {
  late String? message; // رسالة السيرفر
  late int? correct; // عدد الإجابات الصحيحة
  late int? wrong; // عدد الإجابات الخاطئة
  late String? total; // إجمالي عدد الأسئلة

  late List<WrongQuestionModel>? wrongQuestions; // قائمة الأسئلة الخاطئة

  late List<CorrectQuestionModel>? correctQuestions; // قائمة الأسئلة الصحيحة

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
  late String? questionId; // رقم السؤال
  late String? questionText; // نص السؤال
  late String? incorrectAnswer; // الإجابة الخاطئة
  late String? correctAnswer; // الإجابة الصحيحة

  // جعل المعلمات اختيارية
  WrongQuestionModel({
    this.questionId,
    this.questionText,
    this.incorrectAnswer,
    this.correctAnswer,
  });
}

@Embedded()
class CorrectQuestionModel {
  late String? questionId; // رقم السؤال
  late String? questionText; // نص السؤال
  late String? correctAnswer; // الإجابة الصحيحة

  // جعل المعلمات اختيارية
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
