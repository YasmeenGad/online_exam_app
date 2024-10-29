import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';


abstract class ExamOnlineDataSource {
  Future<Result<List<Subject>>> getSubjects( String token);
  Future<Result<List<Exam>>> getExamById(String subjectId, String token);
  Future<Result<Exam>> getExamDetails(String examId, String token);
}