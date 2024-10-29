import 'package:online_exam_app/src/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../../core/utils/errors/result.dart';

abstract class ExamRepo {
  Future<Result<List<Subject>>> getSubjects( String token);
  Future<Result<Exam>> getExamsById(String subjectId , String token);
}
