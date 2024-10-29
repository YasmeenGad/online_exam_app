import '../../domain/entities/response/question_response_entity.dart';

sealed class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class GetQuestionsLoading extends QuestionsState {}

class GetQuestionsSuccess extends QuestionsState {
  final QuestionResponseEntity questionResponseEntity;

  GetQuestionsSuccess(this.questionResponseEntity);
}

class GetQuestionsError extends QuestionsState {
  final String message;

  GetQuestionsError(this.message);
}
