import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../domain/entities/exam_entity.dart';

abstract class ExamOfflineDatasource {
  Future<void> cacheSubjects(List<Subject> subjects);

  Future<List<Subject>> getCachedSubject();

  Future<void> cacheExams(List<Exam> exams);

  Future<List<Exam>> getCachedExams();

  Future<void> cacheExam(Exam exam);

  Future<dynamic> getCachedExam();
}
