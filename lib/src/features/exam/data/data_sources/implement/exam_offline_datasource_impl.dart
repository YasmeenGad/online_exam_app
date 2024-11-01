import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exam_entity.dart';

import '../../../domain/entities/subject_entity.dart';
import '../contracts/exam_offline_datasource.dart';

@Injectable(as: ExamOfflineDatasource)
class ExamOfflineDataSourceImpl implements ExamOfflineDatasource {
  static const String _subjectBox = 'subjectsBox';
  static const String _subjectKey = 'subjects';
  static const String _examsBox = 'examsBox';
  static const String _examsKey = 'exams';
  static const String _examBox = 'examBox';
  static const String _examKey = 'exam';

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
  Future<void> cacheExam(Exam exam) async {
    final box = await Hive.openBox(_examBox);

    await box.put(_examKey, exam.toJson());
  }

  @override
  Future<void> cacheExams(List<Exam> exams) async {
    final box = await Hive.openBox(_examsBox);

    await box.put(_examsKey, exams.map((exam) => exam.toJson()).toList());
  }

  @override
  Future<dynamic> getCachedExam() async {
    final box = await Hive.openBox(_examBox);
    final data = box.get(_examKey);
    if (data != null) {
      return Exam.fromJson(data);
    }
    return null ;
  }

  @override
  Future<List<Exam>> getCachedExams() async {
    final box = await Hive.openBox(_examsBox);
    final data = box.get(_examsKey);
    if (data != null) {
      return Future.value(
          List<Exam>.from(data.map((examJson) => Exam.fromJson(examJson))));
    }
    return Future.value([]);
  }
}
