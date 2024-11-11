import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

import '../../../domain/entities/request/check_question_request_entity.dart';
import '../contracts/offline_datasource/question_offline_datasource.dart';



@Injectable(as: QuestionsOfflineDatasource)




class QuestionsOfflineDatasourceImpl implements QuestionsOfflineDatasource {
  static const String _questionBox = 'questionBox';
  static const String _checkQuestionBox = 'checkQuestionBox';
  static const String _questionKey = 'questions';
  static const String _checkQuestionKey = 'checkQuestions';



  @override
  Future<void> cacheQuestions(QuestionResponseEntity questions, String examId) async {
    final box = await Hive.openBox(_questionBox);
    await box.put(examId, questions.toJson());
  }

  @override
  Future<QuestionResponseEntity?> getCachedQuestions(String examId) async {
    final box = await Hive.openBox(_questionBox);
    final data = box.get(examId);
    if (data != null) {
      return QuestionResponseEntity.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  @override
  Future<void> cacheCheckQuestions(CheckQuestionResponseEntity checkQuestion) async {
    final box = await Hive.openBox(_checkQuestionBox);
    await box.put(_checkQuestionKey, checkQuestion.toJson());


  }

  @override
  Future<CheckQuestionResponseEntity?> getCachedCheckQuestions(CheckQuestionRequestEntity checkQuestion) async {
    final box = await Hive.openBox(_checkQuestionBox);
    final data = box.get(_checkQuestionKey);

    if (data != null) {
      return CheckQuestionResponseEntity.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }


}
