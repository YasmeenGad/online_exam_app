import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart';

import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

import '../../domain/contracts/questions_repository.dart';

@Injectable(as: QuestionsRepository)
class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsOnlineDatasource _questionsOnlineDatasource;

  @factoryMethod
  QuestionsRepositoryImpl(this._questionsOnlineDatasource);

  @override
  Future<Result<QuestionResponseEntity>> getQuestions(
      String token, String examId) async {
    var response = await _questionsOnlineDatasource.getQuestions(token, examId);
    return response;
  }
}
