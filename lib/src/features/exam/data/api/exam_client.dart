import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/exam/data/model/exam_response_dto.dart';
import 'package:online_exam_app/src/features/exam/data/model/subjects_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/constants/app_apis.dart';

part 'exam_client.g.dart';

@lazySingleton
@injectable
@RestApi(baseUrl: AppApis.baseUrl)

abstract class ExamClient {
  @FactoryMethod()
  factory ExamClient(Dio dio) = _ExamClient;

  @GET(AppApis.getSubjects)
  Future<SubjectsResponseDto> getSubjects(
      @Header('token') String token,
      );

  @GET('${AppApis.getExamsById}/{subjectId}')
  Future<ExamResponseDto> getExamById(
      @Header('token') String token,
      @Path('subjectId') String subjectId,
      );
}