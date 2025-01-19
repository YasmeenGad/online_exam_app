import '../../../../core/utils/errors/result.dart';
import '../../data/api/models/isar/question_model.dart';
import '../entities/request/check_question_request_entity.dart';
import '../entities/response/check_question_response_entity.dart';
import '../entities/response/question_response_entity.dart';

abstract class QuestionsRepository {
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId);

  Future<Result<CheckQuestionResponseEntity>> checkQuestions(
      String token, CheckQuestionRequestEntity checkQuestionRequestEntity);

  Future<void> saveQuestion(QuestionModel question);

  Future<List<QuestionModel>> getIsarQuestions();

  Future<QuestionModel?> getQuestionById(String questionId);
}
