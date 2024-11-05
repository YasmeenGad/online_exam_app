import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart';

import '../../../domain/entities/subject_entity.dart';
import '../contracts/exam_offline_datasource.dart';

@Injectable(as: ExamOfflineDatasource)
class ExamOfflineDataSourceImpl implements ExamOfflineDatasource {
  static const String _subjectBox = 'subjectsBox';
  static const String _subjectKey = 'subjects';
  static const String _examsBox = 'examsBox';
  static const String _examBox = 'examBox';

  @FactoryMethod()
  ExamOfflineDataSourceImpl() {
    Hive.openBox(_subjectBox);
  }

  @override
  Future<void> cacheSubjects(List<Subject> subjects) async {
    final box = await Hive.openBox(_subjectBox);

    await box.put(
        _subjectKey, subjects.map((subject) => subject.toJson()).toList());
  }

  @override
  Future<List<Subject>> getCachedSubject() async {
    final box = await Hive.openBox(_subjectBox);
    final data = box.get(_subjectKey);
    if (data != null) {
      return List<Subject>.from(
          data.map((subjectJson) => Subject.fromJson(subjectJson)));
    }
    return [];
  }

  @override
  Future<void> cacheExams(
      List<Exams> exams, String subjectId) async {
    final box = await Hive.openBox(_examsBox);
    await box.put(subjectId, exams.map((exam) => exam.toJson()).toList());
  }

  @override
  Future<List<Exams>> getCachedExams(String subjectId) async {
    final box = await Hive.openBox(_examsBox);
    final data = box.get(subjectId);
    if (data != null) {
      return List<Exams>.from(
        (data as List).map(
          (examJson) => Exams.fromJson(Map<String, dynamic>.from(examJson)),
        ),
      );
    }
    return [];
  }

  @override
  Future<void> cacheExam(Exams exam, String examId) async {
    final box = await Hive.openBox(_examBox);
    await box.put(examId, exam.toJson());
  }

  Future<Exams?> getCachedExam(String examId) async {
    final box = await Hive.openBox(_examBox);
    final data = box.get(examId);
    if (data != null) {
      return Exams.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }
}
