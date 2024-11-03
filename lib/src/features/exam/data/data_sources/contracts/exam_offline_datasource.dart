import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../domain/entities/exams_entity.dart';

abstract class ExamOfflineDatasource {
  Future<void> cacheSubjects(List<Subject> subjects);

  Future<List<Subject>> getCachedSubject( );

  Future<void> cacheExams(List<Exams> exams, String subjectId , String token);

  Future<List<Exams>> getCachedExams( String subjectId , String token);

  Future<void> cacheExam(Exams exam , String examId , String token);

  Future<Exams?> getCachedExam( String examId , String token);
}
