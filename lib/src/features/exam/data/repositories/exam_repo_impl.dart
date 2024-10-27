import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/network/result.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/repositories/exam_repo.dart';

import '../data_sources/contracts/exam_online_datasource.dart';
@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo{
  final ExamOnlineDataSource _examOnlineDataSource;
  ExamRepoImpl(this._examOnlineDataSource);
  @override
  Future<Result<List<Exam>>> getExamsById(String subjectId, String token) async {
    var response =  await _examOnlineDataSource.getExamById(subjectId, token);
    return response;

  }

  @override
  Future<Result<List<Subject>>> getSubjects( String token) async {
    var response = await _examOnlineDataSource.getSubjects(token);
    return response;
  }

  @override
  Future<Result<Exam>> getExamDetails(String examId, String token) async{
    var response = await _examOnlineDataSource.getExamDetails(examId, token);
    return response;
  }

  
}
