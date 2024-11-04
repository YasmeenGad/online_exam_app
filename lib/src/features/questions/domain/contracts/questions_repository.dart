import '../../../../core/utils/errors/result.dart';
import '../entities/request/check_question_request_entity.dart';
import '../entities/response/check_question_response_entity.dart';
import '../entities/response/question_response_entity.dart';

abstract class QuestionsRepository {
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId);

  Future<Result<CheckQuestionResponseEntity>> checkQuestions(
      String token, CheckQuestionRequestEntity checkQuestionRequestEntity);
}
