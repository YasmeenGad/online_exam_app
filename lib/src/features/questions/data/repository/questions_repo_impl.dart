import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/request/check_question_request_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';

import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

import '../../domain/contracts/questions_repository.dart';
import '../datasource/contracts/offline_datasource/question_offline_datasource.dart';

@Injectable(as: QuestionsRepository)
class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsOnlineDatasource _questionsOnlineDatasource;
  final QuestionsOfflineDatasource _questionsOfflineDatasource;

  @factoryMethod
  QuestionsRepositoryImpl(this._questionsOnlineDatasource , this._questionsOfflineDatasource);

  @override
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId) async {
    final cachedQuestions = await _questionsOfflineDatasource.getCachedQuestions(examId);
    print('questions: ${cachedQuestions}');
    if(cachedQuestions != null){
      return Success(data: cachedQuestions);
    }
    var response = await _questionsOnlineDatasource.getQuestions(token, examId);
    return response;
  }

  @override
  Future<Result<CheckQuestionResponseEntity>> checkQuestions(
      String token, CheckQuestionRequestEntity checkQuestionRequestEntity) async {
    final cachedCheckQuestions = await _questionsOfflineDatasource.getCachedCheckQuestions(checkQuestionRequestEntity);
    print('checkQuestions: ${cachedCheckQuestions}');
    if (cachedCheckQuestions != null) {
      return Success(data: cachedCheckQuestions);
    }

    var response = await _questionsOnlineDatasource.checkQuestions(token, checkQuestionRequestEntity);
    return response;
  }
}

