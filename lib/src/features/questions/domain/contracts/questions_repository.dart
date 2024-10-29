import '../../../../core/utils/errors/result.dart';
import '../entities/response/question_response_entity.dart';

abstract class QuestionsRepository {
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId);
}
