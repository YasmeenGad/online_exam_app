import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart';

import 'package:uuid/uuid.dart';
import '../../../../../core/di/di.dart';
import '../../../domain/entities/isar/exam_score.dart';
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
        attemptId: attemptId,  // حفظ الـ attemptId مع السؤال
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

    // استخراج الـ attemptId الفريدة
    List<String?> distinctAttempts = allQuestions.map((q) => q.attemptId).toSet().toList();

    List<Map<String, dynamic>> attemptsWithCounts = [];
    for (var attemptId in distinctAttempts) {
      final questionsForAttempt = await getQuestionsByAttempt(attemptId!);
      attemptsWithCounts.add({
        'attemptId': attemptId,
        'questionCount': questionsForAttempt.length,  // عدد الأسئلة في كل محاولة
      });
    }

    return attemptsWithCounts;  // إرجاع المحاولات مع عدد الأسئلة
  }

  @override
  Future<List<QuestionModel>> getAllQuestionsForAttempt(String attemptId) async {
    return await isar.questionModels
        .filter()
        .attemptIdEqualTo(attemptId)
        .findAll();
  }

  // دالة للحصول على attemptId الحالي أو توليد واحد جديد إذا لم يكن موجود
  Future<String?> _getCurrentAttemptId() async {
    final allQuestions = await getIsarQuestions();
    if (allQuestions.isNotEmpty) {
      return allQuestions.last.attemptId;  // العودة لأحدث attemptId
    }
    return Uuid().v4();  // إنشاء attemptId جديد لو مفيش محاولات سابقة
  }

  // دالة للحصول على attemptId فريد في حال لم يكن موجود
  Future<String> getNewAttemptId() async {
    String? currentAttemptId = await _getCurrentAttemptId();
    if (currentAttemptId == null) {
      // إذا لم يكن موجود، يتم توليد attemptId جديد
      return Uuid().v4();
    } else {
      // إذا كان موجود، نعيد نفس الـ attemptId
      return currentAttemptId;
    }
  }
}