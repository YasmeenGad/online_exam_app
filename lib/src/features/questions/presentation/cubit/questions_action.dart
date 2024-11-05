import 'package:flutter/cupertino.dart';

import '../../domain/entities/request/check_question_request_entity.dart';

sealed class QuestionsAction {}

class GetQuestionsAction extends QuestionsAction {
  String examId;
  BuildContext context;

  GetQuestionsAction({required this.context, required this.examId});
}

class CheckQuestionAction extends QuestionsAction {
  CheckQuestionRequestEntity request;
  BuildContext context;

  CheckQuestionAction({required this.context, required this.request});
}
