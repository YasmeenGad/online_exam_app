import '../../domain/entities/response/check_question_response_entity.dart';
import '../../domain/entities/response/question_response_entity.dart';

sealed class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

/* get questions states */

class GetQuestionsLoading extends QuestionsState {}

class GetQuestionsSuccess extends QuestionsState {
  final QuestionResponseEntity questionResponseEntity;

  GetQuestionsSuccess(this.questionResponseEntity);
}

class GetQuestionsError extends QuestionsState {
  final String message;

  GetQuestionsError(this.message);
}

/* check question states */

class CheckQuestionLoading extends QuestionsState {}

class CheckQuestionSuccess extends QuestionsState {
  final CheckQuestionResponseEntity checkQuestionResponseEntity;

  CheckQuestionSuccess(this.checkQuestionResponseEntity);
}

class CheckQuestionError extends QuestionsState {
  final String message;

  CheckQuestionError(this.message);
}
 class QuestionsUpdated extends QuestionsState {}

class QuestionChanged extends QuestionsState {
  final int questionIndex;

  QuestionChanged(this.questionIndex);
}
class ExamFinished extends QuestionsState {}
class TimeUpdated extends QuestionsState {
  final int time;

  TimeUpdated(this.time);
}
class TimeOut extends QuestionsState {}