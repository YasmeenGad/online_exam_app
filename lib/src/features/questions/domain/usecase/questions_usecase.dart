import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/questions/domain/contracts/questions_repository.dart';

import '../../../../core/utils/errors/result.dart';
import '../entities/response/question_response_entity.dart';

@injectable
class QuestionsUseCase {
  final QuestionsRepository _questionsRepository;

  @factoryMethod
  QuestionsUseCase(this._questionsRepository);

  Future<Result<QuestionResponseEntity>> getQuestions(
      String examId, String token) async {
    return await _questionsRepository.getQuestions(examId, token);
  }
}
