import '../../../../domain/entities/request/check_question_request_entity.dart';
import '../../../../domain/entities/response/check_question_response_entity.dart';
import '../../../../domain/entities/response/question_response_entity.dart';

abstract class QuestionsOfflineDatasource {
  Future<void> cacheQuestions(QuestionResponseEntity questions, String examId);

  Future<QuestionResponseEntity?> getCachedQuestions(String examId);

  Future<void> cacheCheckQuestions(CheckQuestionResponseEntity checkQuestion);

  Future<CheckQuestionResponseEntity?> getCachedCheckQuestions(CheckQuestionRequestEntity checkQuestionRequestEntity);


}