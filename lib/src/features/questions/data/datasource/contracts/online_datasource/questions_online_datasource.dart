import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';
import '../../../../domain/entities/request/check_question_request_entity.dart';

abstract class QuestionsOnlineDatasource {
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId);

  Future<Result<CheckQuestionResponseEntity>> checkQuestions(
      String token, CheckQuestionRequestEntity checkQuestionRequestEntity);
}
