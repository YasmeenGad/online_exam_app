import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/api/api_execution.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/api/question_retrofit_client.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/request/check_question_request_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';
import '../contracts/online_datasource/questions_online_datasource.dart';

@Injectable(as: QuestionsOnlineDatasource)
class QuestionsOnlineDatasourceImpl implements QuestionsOnlineDatasource {
  final QuestionRetrofitClient _questionRetrofitClient;

  @factoryMethod
  QuestionsOnlineDatasourceImpl(this._questionRetrofitClient);

  @override
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId) async {
    return await apiExecute(
        tryCode: () => _questionRetrofitClient.getQuestions(token, examId),
        domainMapper: (response) => response.toEntity());
  }

  @override
  Future<Result<CheckQuestionResponseEntity>> checkQuestions(String token,
      CheckQuestionRequestEntity checkQuestionRequestEntity) async {
    return await apiExecute(
        tryCode: () => _questionRetrofitClient.checkQuestion(
            token, checkQuestionRequestEntity.toDto()),
        domainMapper: (response) => response.toEntity());
  }
}
