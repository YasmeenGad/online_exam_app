import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/questions/domain/contracts/questions_repository.dart';

import '../../../../core/utils/errors/result.dart';
import '../../data/api/models/isar/question_model.dart';
import '../entities/isar/exam_score.dart';
import '../entities/request/check_question_request_entity.dart';
import '../entities/response/check_question_response_entity.dart';
import '../entities/response/question_response_entity.dart';

@injectable
class QuestionsUseCase {
  final QuestionsRepository _questionsRepository;

  @factoryMethod
  QuestionsUseCase(this._questionsRepository);

  Future<Result<QuestionResponseEntity>> getQuestions(String token,
      String examId) async {
    return await _questionsRepository.getQuestions(token, examId);
  }

  Future<Result<CheckQuestionResponseEntity>> checkQuestions(String token,
      CheckQuestionRequestEntity checkQuestionRequestEntity) async {
    return await _questionsRepository.checkQuestions(
        token, checkQuestionRequestEntity);
  }

  Future<void> saveQuestion(QuestionModel question) async {
    await _questionsRepository.saveQuestion(question);
  }

  Future<List<QuestionModel>> getIsarQuestions() async {
    return await _questionsRepository.getIsarQuestions();
  }

  Future<QuestionModel?> getQuestionById(String questionId) async {
    return await _questionsRepository.getQuestionById(questionId);
  }
}
