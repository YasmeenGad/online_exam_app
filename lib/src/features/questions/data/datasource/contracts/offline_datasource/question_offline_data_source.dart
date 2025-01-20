import 'package:online_exam_app/src/features/questions/domain/entities/isar/exam_score.dart';

import '../../../api/models/isar/question_model.dart';

abstract class QuestionOfflineDataSource {
  Future<void> saveQuestion(QuestionModel question);

  Future<List<QuestionModel>> getIsarQuestions();

  Future<QuestionModel?> getQuestionById(String questionId);
}
