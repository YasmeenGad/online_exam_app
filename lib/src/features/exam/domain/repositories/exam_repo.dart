import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../../core/utils/errors/result.dart';

abstract class ExamRepo {
  Future<Result<List<Subject>>> getSubjects( String token);
  Future<Result<List<Exams>>> getExamsById(String subjectId , String token);
  Future<Result<Exams>> getExamDetails(String examId , String token);
}
