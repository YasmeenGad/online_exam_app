import 'package:flutter/cupertino.dart';

sealed class QuestionsAction {}

class GetQuestionsAction extends QuestionsAction {
  String examId;
  BuildContext context;

  GetQuestionsAction({required this.context, required this.examId});
}
