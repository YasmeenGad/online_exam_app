import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/exam/data/api/exam_client.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_online_datasource.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import '../../../../../core/utils/api/api_execution.dart';
import '../../../../../core/utils/errors/result.dart';
import '../../../domain/entities/exams_entity.dart';
import '../../model/subjects_response_dto.dart';

@Injectable(as: ExamOnlineDataSource)
class ExamOnlineDataSourceImpl implements ExamOnlineDataSource {
  final ExamClient _examClient;

  ExamOnlineDataSourceImpl(this._examClient);

  @override
  Future<Result<List<Exams>>> getExamById(String subjectId, String token) async {
    return await apiExecute<List<Exams>>(
      tryCode: () => _examClient.getExamById(token, subjectId),
      domainMapper: (response) {
        return response.toDomain();
      },
    );
  }

  @override
  Future<Result<List<Subject>>> getSubjects(String token) async {
    return await apiExecute<List<Subject>>(
      tryCode: () => _examClient.getSubjects(token),
      domainMapper: (response) {
        final subjectsResponse = response as SubjectsResponseDto;
        return subjectsResponse.toDomain();
      },
    );
  }

  @override
  Future<Result<Exams>> getExamDetails(String examId, String token) async {
    return await apiExecute<Exams>(
      tryCode: () => _examClient.getExamDetails(token, examId),
      domainMapper: (response) => response.toDomain(),
    );
  }

}
