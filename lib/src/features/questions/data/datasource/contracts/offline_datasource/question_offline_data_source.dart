import '../../../api/models/isar/question_model.dart';

abstract class QuestionOfflineDataSource {
  Future<void> saveQuestion(QuestionModel question);

  Future<List<QuestionModel>> getIsarQuestions();

  Future<QuestionModel?> getQuestionById(String questionId);

  Future<void> updateQuestion(QuestionModel question);
}
