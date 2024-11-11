import 'package:hive/hive.dart';
import '../../../questions/domain/entities/response/check_question_response_entity.dart';

class CheckQuestionRepository {
  Future<void> saveCheckQuestions(List<CheckQuestionResponseEntity> questions) async {
    var box = await Hive.openBox<CheckQuestionResponseEntity>('checkQuestions');
    await box.addAll(questions);
  }

  Future<List<CheckQuestionResponseEntity>> getCheckQuestions() async {
    var box = await Hive.openBox<CheckQuestionResponseEntity>('checkQuestions');
    return box.values.toList();
  }

  Future<void> clearCheckQuestions() async {
    var box = await Hive.openBox<CheckQuestionResponseEntity>('checkQuestions');
    await box.clear();
  }
}
