import '../../../api/models/isar/question_model.dart';

abstract class QuestionOfflineDataSource {
  Future<void> saveQuestion(QuestionModel question, String attemptId);

  Future<List<QuestionModel>> getIsarQuestions();

  Future<QuestionModel?> getQuestionById(String questionId);

  Future<List<QuestionModel>> getQuestionsByAttempt(String attemptId);

  Future<List<Map<String, dynamic>>> getAttemptsWithQuestionCount();

  Future<List<QuestionModel>> getAllQuestionsForAttempt(String attemptId);
}
