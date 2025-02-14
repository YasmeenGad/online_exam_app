import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart';
import 'package:uuid/uuid.dart';

import '../../api/models/isar/question_model.dart';

@Injectable(as: QuestionOfflineDataSource)
class QuestionOfflineDataSourceImpl implements QuestionOfflineDataSource {
  final Isar isar;

  QuestionOfflineDataSourceImpl(this.isar);

  @override
  Future<void> saveQuestion(QuestionModel question, String attemptId) async {
    await isar.writeTxn(() async {
      final newQuestion = QuestionModel(
        questionId: question.questionId,
        questionText: question.questionText,
        questionType: question.questionType,
        correctAnswer: question.correctAnswer,
        userAnswer: question.userAnswer,
        suggestedAnswers: question.suggestedAnswers,
        examId: question.examId,
        attemptId: attemptId,
      );

      await isar.questionModels.put(newQuestion);
    });
  }

  @override
  Future<List<QuestionModel>> getIsarQuestions() async {
    return await isar.questionModels.where().findAll();
  }

  @override
  Future<QuestionModel?> getQuestionById(String questionId) async {
    return await isar.questionModels
        .filter()
        .questionIdEqualTo(questionId)
        .findFirst();
  }

  @override
  Future<List<QuestionModel>> getQuestionsByAttempt(String attemptId) async {
    return await isar.questionModels
        .filter()
        .attemptIdEqualTo(attemptId)
        .findAll();
  }

  @override
  Future<List<Map<String, dynamic>>> getAttemptsWithQuestionCount() async {
    final allQuestions = await isar.questionModels.where().findAll();

    List<String?> distinctAttempts =
        allQuestions.map((q) => q.attemptId).toSet().toList();

    List<Map<String, dynamic>> attemptsWithCounts = [];
    for (var attemptId in distinctAttempts) {
      final questionsForAttempt = await getQuestionsByAttempt(attemptId!);
      attemptsWithCounts.add({
        'attemptId': attemptId,
        'questionCount': questionsForAttempt.length,
      });
    }

    return attemptsWithCounts;
  }

  @override
  Future<List<QuestionModel>> getAllQuestionsForAttempt(
      String attemptId) async {
    return await isar.questionModels
        .filter()
        .attemptIdEqualTo(attemptId)
        .findAll();
  }

  Future<String?> _getCurrentAttemptId() async {
    final allQuestions = await getIsarQuestions();
    if (allQuestions.isNotEmpty) {
      return allQuestions.last.attemptId;
    }
    return Uuid().v4();
  }

  Future<String> getNewAttemptId() async {
    String? currentAttemptId = await _getCurrentAttemptId();
    if (currentAttemptId == null) {
      return Uuid().v4();
    } else {
      return currentAttemptId;
    }
  }
}
