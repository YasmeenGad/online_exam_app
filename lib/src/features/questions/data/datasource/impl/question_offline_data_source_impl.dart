import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart';

import '../../../../../core/di/di.dart';
import '../../../domain/entities/isar/exam_score.dart';
import '../../api/models/isar/question_model.dart';

@Injectable(as: QuestionOfflineDataSource)
class QuestionOfflineDataSourceImpl implements QuestionOfflineDataSource {
  final Isar isar;

  QuestionOfflineDataSourceImpl(this.isar);

  @override
  Future<void> saveQuestion(QuestionModel question) async {
    final isar = getIt<Isar>();

    await isar.writeTxn(() async {
      final existingQuestion = await isar.questionModels
          .filter()
          .questionIdEqualTo(question.questionId)
          .findFirst();

      if (existingQuestion != null) {
        existingQuestion.userAnswer = question.userAnswer;
        await isar.questionModels.put(existingQuestion);
      } else {
        await isar.questionModels.put(question);
      }
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
}
