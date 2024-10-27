import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/network/result.dart';
import 'package:online_exam_app/src/features/exam/data/api/exam_client.dart';
import 'package:online_exam_app/src/features/exam/data/api/execute_api.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_online_datasource.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../domain/entities/exam_entity.dart';
import '../../model/subjects_response_dto.dart';

@Injectable(as: ExamOnlineDataSource)
class ExamOnlineDataSourceImpl implements ExamOnlineDataSource {
  final ExamClient _examClient;

  ExamOnlineDataSourceImpl(this._examClient);

  @override
  Future<Result<List<Exam>>> getExamById(
      String subjectId, String token) async {
    return await ExecuteApi(
      () {
        return _examClient.getExamById(subjectId, token);
      },
      (response) {
        return response.toDomain();
      },
    );
  }

  @override
  Future<Result<List<Subject>>> getSubjects(String token) async {
    return await ExecuteApi(
          () {
        return _examClient.getSubjects(token);
      },
          (response) {
        final subjectsResponse = response as SubjectsResponseDto;
        return subjectsResponse.toDomain();
      },
    );
  }

}

