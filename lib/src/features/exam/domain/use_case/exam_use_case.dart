import 'package:injectable/injectable.dart';

import '../../../../core/network/result.dart';
import '../entities/exam_entity.dart';
import '../entities/subject_entity.dart';
import '../repositories/exam_repo.dart';

@injectable
class ExamUseCase {
  final ExamRepo _examRepo;

  ExamUseCase(this._examRepo);

  Future<Result<List<Exam>>> getExamsById(String subjectId, String token) async {
    return await _examRepo.getExamsById(subjectId, token);
  }

  Future<Result<List<Subject>>> getSubjects(String token) async {
    return  await _examRepo.getSubjects(token);

  }

  Future<Result<Exam>> getExamDetails(String examId, String token) async {
    return await _examRepo.getExamDetails(examId, token);
  }
}