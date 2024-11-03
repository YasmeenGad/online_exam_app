import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_offline_datasource.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/repositories/exam_repo.dart';
import '../data_sources/contracts/exam_online_datasource.dart';
@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo{
  final ExamOnlineDataSource _examOnlineDataSource;
  final ExamOfflineDatasource _examOfflineDataSource;
  ExamRepoImpl(this._examOnlineDataSource, this._examOfflineDataSource);


  @override
  Future<Result<List<Exams>>> getExamsById(String subjectId, String token) async {
    final cachedExams = await _examOfflineDataSource.getCachedExams(subjectId , token);
    if(cachedExams.isNotEmpty){
      return Success(data: cachedExams);
    }
    var response =  await _examOnlineDataSource.getExamById(subjectId, token);
    return response;

  }

  @override
  Future<Result<Exams>> getExamDetails(String examId, String token) async{
  final cachedExam = await _examOfflineDataSource.getCachedExam(examId , token);
    if(cachedExam  != null){
      return Success(data: cachedExam);
    }
    var response = await _examOnlineDataSource.getExamDetails(examId, token);
    return response;
  }

  @override

  Future<Result<List<Subject>>> getSubjects( String token) async {
    final cachedSubjects = await _examOfflineDataSource.getCachedSubject();
    if(cachedSubjects.isNotEmpty){
      return Success(data: cachedSubjects);
    }
    var response = await _examOnlineDataSource.getSubjects(token);
    return response;
  }



  
}
