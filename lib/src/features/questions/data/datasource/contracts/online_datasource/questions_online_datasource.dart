import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

abstract class QuestionsOnlineDatasource {
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId);
}