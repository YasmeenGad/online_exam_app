import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/request/check_question_request_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';

import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

import '../../domain/contracts/questions_repository.dart';
import '../api/models/isar/question_model.dart';
import '../datasource/contracts/offline_datasource/question_offline_data_source.dart';

@Injectable(as: QuestionsRepository)
class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsOnlineDatasource _questionsOnlineDatasource;

  final QuestionOfflineDataSource _localDataSource;

  @factoryMethod
  QuestionsRepositoryImpl(
      this._questionsOnlineDatasource, this._localDataSource);

  @override
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId) async {
    var response = await _questionsOnlineDatasource.getQuestions(token, examId);
    return response;
  }

  @override
  Future<Result<CheckQuestionResponseEntity>> checkQuestions(String token,
      CheckQuestionRequestEntity checkQuestionRequestEntity) async {
    var response = await _questionsOnlineDatasource.checkQuestions(
        token, checkQuestionRequestEntity);
    return response;
  }

  @override
  Future<void> saveQuestion(QuestionModel question) async {
    // التحقق من وجود السؤال في قاعدة البيانات أولاً
    final existingQuestion =
        await _localDataSource.getQuestionById(question.questionId);

    if (existingQuestion != null) {
      // إذا كان السؤال موجودًا، تحقق مما إذا كانت الإجابة قد تغيرت
      if (existingQuestion.userAnswer != question.userAnswer) {
        // إذا كانت الإجابة مختلفة، قم بتحديث الإجابة
        await _localDataSource.updateQuestion(question);
      }
    } else {
      // إذا لم يكن السؤال موجودًا، قم بحفظه كـ new question
      await _localDataSource.saveQuestion(question);
    }
  }

  @override
  Future<List<QuestionModel>> getIsarQuestions() async {
    return await _localDataSource.getIsarQuestions();
  }

  @override
  Future<QuestionModel?> getQuestionById(String questionId) async {
    return await _localDataSource.getQuestionById(questionId);
  }
}
