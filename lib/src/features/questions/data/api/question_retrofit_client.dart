import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/api/models/request/check_question_request_dto.dart';
import 'package:online_exam_app/src/features/questions/data/api/models/response/check_question_response_dto.dart';
import 'package:online_exam_app/src/features/questions/data/api/models/response/question_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_apis.dart';

part 'question_retrofit_client.g.dart';

@Singleton()
@Injectable()
@RestApi(baseUrl: AppApis.baseUrl)
abstract class QuestionRetrofitClient {
  @factoryMethod
  factory QuestionRetrofitClient(Dio dio) = _QuestionRetrofitClient;

  @GET(AppApis.getQuestions)
  Future<QuestionResponseDto> getQuestions(
    @Header("token") String token,
    @Query("exam") String examId,
  );

  @POST(AppApis.checkQuestion)
  Future<CheckQuestionResponseDto> checkQuestion(@Header("token") String token,
      @Body() CheckQuestionRequestDto checkQuestionRequestDto);
}
